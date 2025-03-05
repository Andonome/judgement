include config/vars

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2 | head -1)

config/vars:
	@git submodule update --init
shield_qr.tex:
	@printf '\qrcode[height=.7\\textwidth]{$(SHIELD_TARGET)}' > shield_qr.tex

output += shield_qr.tex

$(DBOOK): LOCTEX HANDOUTS STYLE_FILES EXTERNAL | qr.tex shield_qr.tex
	@$(COMPILER) main.tex

shield.pdf: shield.tex commands.tex EXTERNAL config/markets/ ## Judge shield
	$(RUN) shield.tex
	$(RUN) shield.tex
	@$(CP) $(DROSS)/shield.pdf .

targets += shield.pdf

images/extracted/cover.jpg: images/loh/dragon.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/$(BOOK)_cover.pdf: config/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) -jobname $(BOOK)_cover $<
cover.pdf: $(DROSS)/$(BOOK)_cover.pdf
	$(CP) $< $@

targets += cover.pdf

