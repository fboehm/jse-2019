MANUSCRIPT = jse-2019-ms

all: $(MANUSCRIPT).md

$(MANUSCRIPT).md: $(MANUSCRIPT).Rmd methods.Rmd abstract.Rmd discussion.Rmd introduction.Rmd results.Rmd
	R -e "rmarkdown::render('$<', output_format = 'all')"

