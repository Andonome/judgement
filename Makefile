include config/vars

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2)

output: $(BOOK).pdf

qr.tex: README.md config/vars
	@printf '\qrcode[height=.2\\textwidth]{$(QR_TARGET)}' > qr.tex
config/vars:
	@git submodule update --init
shield_qr.tex:
	@printf '\qrcode[height=.7\\textwidth]{$(SHIELD_TARGET)}' > shield_qr.tex

$(BOOK).pdf: $(DEPS) | qr.tex shield_qr.tex
	@$(COMPILER) main.tex

shield.pdf:shield.tex commands.tex $(BOOK).pdf
	$(RUN) shield.tex
	$(RUN) shield.tex
	mv $(DROSS)/shield.pdf .

.PHONY: all
all: $(BOOK).pdf shield.pdf

clean:
	$(CLEAN) shield_qr.tex
