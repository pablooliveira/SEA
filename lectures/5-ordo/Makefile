SRCS = $(wildcard *.md)
ALL_PDF = $(patsubst %.md,%.pdf,$(SRCS))

all: pdf

pdf: $(ALL_PDF)

5-ordo.pdf: 5-ordo.md
	pandoc --include-in-header header.tex -V theme:CambridgeUS -t beamer -f markdown $< -o 5-ordo.tex
	latex 5-ordo.tex
	dvips 5-ordo.dvi
	ps2pdf 5-ordo.ps


clean:
	rm -f $(ALL_PDF) *.snm *.toc *.out *.nav *.aux *.log *.ps *.dvi 5-ordo.tex *.vrb
