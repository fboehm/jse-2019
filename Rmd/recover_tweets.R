#' Recovers Twitter damaged stream data (JSON file) into parsed data frame.
#'
#' @param path Character, name of JSON file with data collected by
#'   \code{\link{stream_tweets}}.
#' @param dir Character, name of a directory where intermediate files are
#'   stored.
#' @param verbose Logical, should progress be displayed?
#' 
#' @family stream tweets
# https://gist.githubusercontent.com/JBGruber/dee4c44e7d38d537426f57ba1e4f84ab/raw/ab87bebb8d020c2f96c71a40a483dc96a4c80e54/recover_stream.R
recover_stream <- function(path, dir = NULL, verbose = TRUE) {
  
  # read file and split to tweets
  lines <- readChar(path, file.info(path)$size, useBytes = TRUE)
  tweets <- stringi::stri_split_fixed(lines, "\n{")[[1]]
  tweets[-1] <- paste0("{", tweets[-1])
  tweets <- tweets[!(tweets == "" | tweets == "{")]
  
  # remove misbehaving characters
  tweets <- gsub("\r", "", tweets, fixed = TRUE)
  tweets <- gsub("\n", "", tweets, fixed = TRUE)
  
  # write tweets to disk and try to read them in individually
  if (is.null(dir)) {
    dir <- paste0(tempdir(), "/tweets/")
    dir.create(dir, showWarnings = FALSE)
  }
  
  if (verbose) {
    pb <- progress::progress_bar$new(
      format = "Processing tweets [:bar] :percent, :eta remaining",
      total = length(tweets), clear = FALSE
    )
    pb$tick(0)
  }
  
  tweets_l <- lapply(tweets, function(t) {
    pb$tick()
    id <- unlist(stringi::stri_extract_first_regex(t, "(?<=id\":)\\d+(?=,)"))[1]
    f <- paste0(dir, id, ".json")
    writeLines(t, f, useBytes = TRUE)
    out <- tryCatch(rtweet::parse_stream(f),
                    error = function(e) {})
    if ("tbl_df" %in% class(out)) {
      return(out)
    } else {
      return(id)
    }
  })
  
  # test which ones failed
  test <- vapply(tweets_l, is.character, FUN.VALUE = logical(1L))
  bad_files <- unlist(tweets_l[test])
  
  # Let user decide what to do
  if (length(bad_files) > 0) {
    message("There were ", length(bad_files),
            " tweets with problems. Should they be copied to your working directory?")
    #sel <- menu(c("no", "yes", "copy a list with status_ids"))
    writeLines(bad_files, "broken_tweets.txt")
  }
  
  # clean up
  unlink(dir, recursive = TRUE)
  
  # return good tweets
  return(dplyr::bind_rows(tweets_l[!test]))
}