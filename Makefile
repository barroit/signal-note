# SPDX-License-Identifier: GPL-3.0-or-later

export objtree := build
export lualatex ?= lualatex

notes-dir := $(addsuffix /,$(shell LC_ALL=C find * -type d -name '[! -~]*'))
notes := $(addprefix $(objtree)/,$(notes-dir:/=.pdf))

.PHONY: $(notes-dir)

$(notes):

$(notes-dir):
	$(MAKE) -f $(@)/Makefile

$(objtree)/%.pdf: %/
	mkdir -p $(@D)
	cp $*/$(objtree)/note.pdf $@
