BOOK = $(shell basename "$$(pwd)")

output: $(BOOK).pdf

config/bind.sty:
	@git submodule update --init

shield_link.png:
	grep -q 'shield\.pdf' README.md
	tail -n 1 README.md  | cut -d' ' -f2 |qrencode -o shield_link.png
svg-inkscape: | config/bind.sty shield_link.png
	@pdflatex -shell-escape -jobname $(BOOK) main.tex
$(BOOK).glo: | svg-inkscape
	@pdflatex -jobname $(BOOK) main.tex
$(BOOK).sls: | $(BOOK).glo
	@makeglossaries $(BOOK)
$(BOOK).pdf: $(BOOK).sls $(wildcard *.tex) $(wildcard config/*.sty)
	@pdflatex -jobname $(BOOK) main.tex

shield.pdf: shield.tex $(BOOK).sls
	pdflatex shield.tex

all: $(BOOK).pdf shield.pdf
	latexmk -jobname=$(BOOK) -shell-escape -pdf main.tex

clean:
	rm -fr *.aux *.sls *.slo *.slg *.toc *.acn *.log *.out *.idx *.ist *.glo *.glg *.gls *.acr *.alg \
	*.pdf \
	svg-inkscape \
	*.fdb_latexmk \
	*.png \
	*.ilg \
	*.ing \
	*.fls

.PHONY: clean all
