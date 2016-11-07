SRCS = $(wildcard *.md)
ALL_PDF = $(patsubst %.md,%.pdf,$(SRCS))

all: pdf

pdf: $(ALL_PDF)

6-ordoTR.pdf: 6-ordoTR.md
	pandoc --include-in-header header.tex -V theme:CambridgeUS -t beamer -f markdown $< -o 6-ordoTR.tex
	latex 6-ordoTR.tex
	dvips 6-ordoTR.dvi
	ps2pdf 6-ordoTR.ps


clean:
	rm -f $(ALL_PDF) *.snm *.toc *.out *.nav *.aux *.log *.ps *.dvi 6-ordoTR.tex *.vrb
