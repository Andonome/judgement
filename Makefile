EXTERNAL_REFERENTS = core stories

pdfs += shield.pdf

include config/vars

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2 | head -1)

config/vars:
	@git submodule update --init
shield_qr.tex:
	@printf '%s' '\qrcode[height=.7\textwidth]{$(SHIELD_TARGET)}' > $@

output += shield_qr.tex

$(DBOOK): $(DEPS) qr.tex shield_qr.tex

shield.pdf: shield.tex commands.tex $(wildcard config/markets/*) ## Judge shield

images/extracted/cover.jpg: images/loh/dragon.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/$(BOOK)_cover.pdf: config/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) -jobname $(BOOK)_cover $<
cover.pdf: $(DROSS)/$(BOOK)_cover.pdf
	$(CP) $< $@

