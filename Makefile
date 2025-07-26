EXTERNAL_REFERENTS = core stories

targets += shield.pdf
zines += almanac.pdf
output += booklets

include config/common.mk

SHIELD_TARGET = $(shell grep 'shield\.pdf' README.md | cut -d' ' -f2 | head -1)

config/common.mk:
	@git submodule update --init
shield_qr.tex:
	@printf '%s' '\qrcode[height=.7\textwidth]{$(SHIELD_TARGET)}' > $@

output += shield_qr.tex

DEPS += $(wildcard *.tex)

$(DBOOK): $(DEPS) qr.tex shield_qr.tex

$(DROSS)/shield.pdf: $(wildcard config/markets/*) | $(DBOOK) ## Judge shield

images/extracted/cover.jpg: images/loh/dragon.jpg images/extracted/inclusion.tex
	$(CP) $< $@
$(DROSS)/$(BOOK)_cover.pdf: config/share/cover.tex cover.tex images/extracted/cover.jpg $(DBOOK)
	$(RUN) -jobname $(BOOK)_cover $<
cover.pdf: $(DROSS)/$(BOOK)_cover.pdf
	$(CP) $< $@

######## A7 Almanac ########

no_encounters != ls encounters/enc_* | wc -w

booklets/no_enc.tex: $(wildcard encounters/enc_*.tex) | booklets/
	printf '\setcounter{noEncounters}{$(no_encounters)}' > $@
	

booklets/a7_almanac.tex: encounters/head.tex booklets/no_enc.tex $(DBOOK)
	$(CP) $< $@

