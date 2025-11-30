EXTERNAL_REFERENTS = core stories

targets += shield.pdf
targets += $(TITLE)_cover.pdf
zines += almanac.pdf
output += shield_qr.tex

include config/common.mk

$(DROSS)/a7_almanac.pdf: $(DBOOK) $(wildcard encounters/*.tex)

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2 | head -1)

config/common.mk:
	@git submodule update --init
shield_qr.tex:
	@printf '%s' '\qrcode[height=.7\textwidth]{$(SHIELD_TARGET)}' > $@

DEPS += $(wildcard *.tex)

images/extracted/cover.jpg: images/loh/dragon.jpg | images/extracted/inclusion.tex
	$(CP) $< $@

$(DBOOK): $(DEPS) qr.tex shield_qr.tex

$(DROSS)/shield.pdf: $(wildcard config/markets/*) | $(DBOOK) ## Judge shield

shield.pdf: $(DROSS)/vanity.pdf
	pdfjam --papersize 420mm,148mm  $< '1' --angle 180 -o /dev/stdout | pdfjam /dev/stdin '1' $< '2' --landscape --nup 1x2 -o $@
