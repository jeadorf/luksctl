pkgname=luksctl
pkgver=0.0.2-dev
distname=$(pkgname)-$(pkgver)

sources=luksctl COPYING examples/backup
target=build/$(distname).tar.gz

$(target): $(sources)
	rm -r -f build/$(distname)
	mkdir -p build/$(distname)
	cp --parents $(sources) build/$(distname)
	echo $(pkgver) > build/$(distname)/VERSION
	cd build/$(distname) && tar cvzf ../$(distname).tar.gz *

.PHONY: clean
clean:
	rm -r -f build
