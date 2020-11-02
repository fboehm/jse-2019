MANUSCRIPT = jse-special-issue-2020-november

all: $(MANUSCRIPT).pdf

$(MANUSCRIPT).pdf: $(MANUSCRIPT).Rmd abstract.Rmd jse.bib
	R -e "rmarkdown::render('$<', output_format = 'all')"

