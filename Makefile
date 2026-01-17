EXTERNAL_REFERENTS = core stories

targets += shield.pdf
targets += $(TITLE)_cover.pdf
zines += almanac.pdf
zines += faces.pdf
output += shield_qr.tex

include config/common.mk

$(DROSS)/a7_almanac.pdf: $(DBOOK) $(wildcard encounters/*.tex)

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2 | head -1)

$(DBOOK): $(DEPS) qr.tex shield_qr.tex

config/common.mk:
	@git submodule update --init
shield_qr.tex:
	@printf '%s' '\qrcode[height=.7\textwidth]{$(SHIELD_TARGET)}' > $@

images/extracted/cover.jpg: images/loh/dragon.jpg | images/extracted/inclusion.tex
	$(CP) $< $@

$(DROSS)/flip.pdf: $(DROSS)/vanity.pdf | $(DROSS)/
	pdfjam --papersize 420mm,148mm  $< '1' --angle 180 -o $@
shield.pdf: $(DROSS)/flip.pdf | $(DROSS)/vanity.pdf ## Judge shield
	pdfjam $< '1' $| '2' --landscape --nup 1x2 -o $@
