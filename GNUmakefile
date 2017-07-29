.DEFAULT_GOAL := build
CXX       ?= c++
CRAMOPTS  ?= --shell=/usr/bin/zsh
CRAM_ROOT ?= cram
CRAM_PATH ?= $(CRAM_ROOT)

PREFIX   ?= /usr/local
LIBDIR   ?= $(DESTDIR)$(PREFIX)/lib
BINDIR   ?= $(DESTDIR)$(PREFIX)/bin
MANDIR   ?= $(DESTDIR)$(PREFIX)/man/man1

BROOTDIR   = _build
BLIBDIR    = $(BROOTDIR)/lib
BBINDIR    = $(BROOTDIR)/bin
BMANDIR    = $(BROOTDIR)/man/man1

DIRS = $(BLIBDIR) $(BBINDIR)

CMDS     = $(patsubst src/soapcli/%.zsh,%,$(wildcard src/soapcli/*))
MANS     = $(patsubst Documentation/%.rst,%.1,$(wildcard Documentation/soapcli*))

BUILD_DEPS  =
BUILD_DEPS += $(BMANDIR)
BUILD_DEPS += $(BBINDIR)/soapcli
BUILD_DEPS += $(addprefix $(BBINDIR)/soapcli-,$(CMDS))
BUILD_DEPS += $(addprefix $(BMANDIR)/,$(MANS))

INSTALL_DEPS += $(MANDIR)
INSTALL_DEPS += $(BINDIR)/soapcli
INSTALL_DEPS += $(addprefix $(BINDIR)/soapcli-,$(CMDS))
INSTALL_DEPS += $(addprefix $(MANDIR)/,$(MANS))

CHECK_PATH = $(PWD)/$(BROOTDIR)/fakeroot/usr/local/bin:/bin:/usr/bin:/usr/local/bin

.PHONY: build
build: $(BUILD_DEPS)

$(BBINDIR)/soapcli-%: src/soapcli/%.zsh

	install -m755 -D $< $@

$(BBINDIR)/git-%: src/git/%.zsh

	install -m755 -D $< $@

$(BBINDIR)/soapcli: src/soapcli.zsh

	install -m755 -D $< $@

$(BMANDIR):

	install -d $@

$(BMANDIR)/%.1: Documentation/%.rst

	rst2man $< $@

.PHONY: install
install: $(INSTALL_DEPS)

$(BINDIR)/%: $(BBINDIR)/%

	install -m755 -D $< $@

$(MANDIR):

	install -d $@

$(MANDIR)/%: $(BMANDIR)/%

	install -m644 $< $@

.PHONY: clean
clean:

	$(RM) -r $(BROOTDIR) $(CRAM_ROOT)/*.t.err

.PHONY: check
check: build

	mkdir -p $(BROOTDIR)/fakeroot
	DESTDIR=$(BROOTDIR)/fakeroot $(MAKE) install
	env -i PATH=$(CHECK_PATH) cram $(CRAMOPTS) $(CRAM_PATH)
