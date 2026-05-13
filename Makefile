EXTERNAL_REFERENTS = core stories

targets += shield.pdf
targets += $(TITLE)_cover.pdf
zines += almanac.pdf
zines += deep.pdf
zines += forest.pdf
zines += roads.pdf
zines += warren.pdf
targets += Statblocks.pdf
output += shield_qr.tex
zine_builds = $(patsubst %, $(DROSS)/a7_%, $(zines))

include config/common.mk

$(zine_builds): $(DBOOK)
$(DROSS)/a7_almanac.pdf: $(wildcard encounters/*.tex)

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2 | head -1)

$(DBOOK): $(DEPS) qr.tex shield_qr.tex

config/common.mk:
	@git submodule update --init
shield_qr.tex:
	@printf '%s' '\qrcode[height=.7\textwidth]{$(SHIELD_TARGET)}' > $@

images/extracted/cover.jpg: images/loh/dragon.jpg | images/extracted/inclusion.tex
	$(CP) $< $@

$(DROSS)/flip.pdf: $(DROSS)/vanity.pdf | $(DROSS)/
	pdfjam $(TEX_ARGS) --papersize 420mm,148mm  $< '1' --angle 180 -o $@
shield.pdf: $(DROSS)/flip.pdf | $(DROSS)/vanity.pdf ## Judge shield
	pdfjam $(TEX_ARGS) $< '1' $| '2' --landscape --nup 1x2 -o $@

config/%.pdf:
	make -C config $(notdir $@ )


$(DROSS)/bailey_1.pdf: config/markets.pdf | $(DROSS)/
	pdfjam $(TEX_ARGS) $^ 1-4,9-10 \
 	--outfile $@

Statblocks.pdf: $(DROSS)/bailey_1.pdf $(zines) config/spells.pdf ## Make NPC statblock zines
	pdfjam $(TEX_ARGS) --pdftitle $(basename $@) --pdfsubject "BIND RPG" \
	$(TEX_ARGS) \
	--pdfkeywords "RPG,TTRPG,roleplaying" \
	$^ \
	--outfile $@
