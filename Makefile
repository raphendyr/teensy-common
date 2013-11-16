PREFIX = $(if $(DESTDIR),$(DESTDIR)/usr,$(if $(filter root,$(USER)),/usr/local,$(HOME)/.local))
BINDIR = $(PREFIX)/bin
LIBDIR = $(PREFIX)/lib/$(TARGET)
ETCDIR = $(DESTDIR)/etc
UDEVRULES = $(ETCDIR)/udev/rules.d/

.PHONY: build
build:

.PHONY: install
install: 49-teensy.rules
	install -D -T -m 0644 -o root $< $(UDEVRULES)/$<

.PHONY: clean
clean:
