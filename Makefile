.PHONY: all build clean install package

# Target implicit - creează pachetul Arch
all: package

# Creează pachetul Arch nesemnat folosind PKGBUILD
package:
	makepkg --skipinteg --noconfirm

# Compilează proiectul direct (fără a crea pachet)
build:
	rm -rf build
	mkdir -p build
	cd build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	cd build && make -j$$(nproc)

# Instalează proiectul compilat (necesită sudo)
install: build
	cd build && sudo make install

# Curăță fișierele de build
clean:
	rm -rf build
	rm -rf *.pkg.tar.zst
	rm -rf pkg
	rm -rf liquid-gel
	rm -rf src/liquid-gel

