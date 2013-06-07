pkgname=luksctl
pkgver=0.0.2-dev
distname=$(pkgname)-$(pkgver)

sources=luksctl COPYING examples/backup doc/luksctl.profile.5 doc/luksctl.8
target=build/$(distname).tar.gz

$(target): $(sources)
	rm -r -f build/$(distname)
	mkdir -p build/$(distname)
	cp --parents $(sources) build/$(distname)
	echo $(pkgver) > build/$(distname)/VERSION
	gzip build/$(distname)/doc/luksctl.profile.5
	gzip build/$(distname)/doc/luksctl.8
	cd build/$(distname) && tar cvzf ../$(distname).tar.gz *

.PHONY: clean
clean:
	rm -r -f build
