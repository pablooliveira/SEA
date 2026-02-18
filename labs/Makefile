SRCS = $(wildcard *.md)
ALL_HTML = $(patsubst %.md,%.html,$(SRCS))

all: html

html: $(ALL_HTML)

%.html: %.md
	pandoc --embed-resources --standalone -s -c pandoc.css --toc --mathjax -f markdown $< -o $@

clean:
	rm $(ALL_HTML)
