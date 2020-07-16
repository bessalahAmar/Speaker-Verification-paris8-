NAME=memoire
TEX=$(NAME).tex
SRC=$(TEX) $(NAME).bib
PDF=$(TEX:.tex=.pdf)

all: $(PDF)

$(PDF):	$(SRC)
	pdflatex $(TEX)
	bibtex   $(NAME)
	pdflatex $(TEX)
	pdflatex $(TEX)

clean:
	rm -f $(PDF) $(NAME).aux $(NAME).log $(NAME).loa $(NAME).lof $(NAME).bbl $(NAME).blg $(NAME).locs *~
