prefix=/usr/local
bindir=$(prefix)/bin

INSTALL=install

all: git-mark

install: all
	$(INSTALL) -m 755 git-mark $(bindir)/git-mark
	rm -f $(bindir)/git-unmark
	ln -sf git-mark $(bindir)/git-unmark
