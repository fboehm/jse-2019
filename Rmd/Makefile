MANUSCRIPT = jse-special-issue-2020-october

all: $(MANUSCRIPT).md

$(MANUSCRIPT).md: $(MANUSCRIPT).Rmd abstract.Rmd 
	R -e "rmarkdown::render('$<', output_format = 'all')"

