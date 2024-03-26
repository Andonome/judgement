BOOK = $(shell basename "$$(pwd)")
SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2)
QR_TARGET = $(shell grep 'mailto' README.md | cut -d' ' -f3)

output: $(BOOK).pdf

qr.tex: README.md
	@printf '\qrcode[height=.2\\textwidth]{$(QR_TARGET)}' > qr.tex
config/bind.sty:
	@git submodule update --init
shield_qr.tex:
	@printf '\qrcode[height=.7\\textwidth]{$(SHIELD_TARGET)}' > shield_qr.tex
svg-inkscape:| config/bind.sty shield_qr.tex qr.tex
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
	*.ind \
	shield_qr.tex \
	qr.tex \
	*.fls

.PHONY: clean all
