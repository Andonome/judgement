include config/vars

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2)

config/vars:
	@git submodule update --init
shield_qr.tex:
	@printf '\qrcode[height=.7\\textwidth]{$(SHIELD_TARGET)}' > shield_qr.tex

$(DBOOK): $(DEPS) | qr.tex shield_qr.tex
	@$(COMPILER) main.tex

shield.pdf: shield.tex commands.tex $(DBOOK) config/markets/
	$(RUN) shield.tex
	$(RUN) shield.tex
	@$(CP) $(DROSS)/shield.pdf .

.PHONY: all
all: $(RELEASE) shield.pdf

clean:
	$(CLEAN) shield_qr.tex
