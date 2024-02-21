BOOK = $(shell basename "$$(pwd)")
QR_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2)

output: $(BOOK).pdf

config/bind.sty:
	@git submodule update --init
qr.tex:
	@echo '\qrcode[height=.7\\textwidth]{$(QR_TARGET)}' > qr.tex
svg-inkscape:| config/bind.sty qr.tex
	@pdflatex -shell-escape -jobname $(BOOK) main.tex
$(BOOK).pdf: svg-inkscape $(wildcard *.tex) $(wildcard config/*.sty)
	@pdflatex -jobname $(BOOK) main.tex

shield.pdf:| shield.tex commands.tex $(BOOK).pdf
	pdflatex shield.tex
	pdflatex shield.tex

all: $(BOOK).pdf shield.pdf
	latexmk -jobname=$(BOOK) -shell-escape -pdf main.tex

clean:
	rm -fr *.aux *.sls \
	*.slo \
	*.slg \
	*.toc *.acn *.log *.out *.idx *.ist \
	*glo \
	*glg \
	*gls \
	*.acr \
	*.alg \
	*.pdf \
	svg-inkscape \
	*.fdb_latexmk \
	*.png \
	*.ilg \
	*.ing \
	qr.tex \
	*.fls

.PHONY: clean all
