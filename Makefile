TEXFILES = $(wildcard *.tex)
PDFFILES = $(TEXFILES:.tex=.pdf)

all: clean pdf

pdf: $(PDFFILES)

%.pdf: %.tex
	@xelatex $<
	@xelatex $<

clean:
	@rubber --clean --pdf $(TEXFILES:.tex=)

x:
	@xpdf $(PDFFILES) &> /dev/null &
e:
	@evince $(PDFFILES) &> /dev/null &
o:
	@okular $(PDFFILES) &> /dev/null &

.PHONY: pdf clean all
