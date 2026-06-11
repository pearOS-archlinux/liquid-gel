# Maintainer: Alexandru Balan <alex@pear-software.com>
pkgname=pearos-liquidgel
pkgver=26.6
pkgrel=1
pkgdesc="Fork of the KWin Blur effect for pearOS with additional features (including force blur) and bug fixes"
arch=('x86_64')
url="https://github.com/pearOS-archlinux/liquid-gel"
license=('GPL3')
depends=(
    'kwin'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kcrash'
    'kglobalaccel'
    'ki18n'
    'kio'
    'kservice'
    'knotifications'
    'kwidgetsaddons'
    'kwindowsystem'
    'kguiaddons'
    'kcmutils'
    'libepoxy'
    'kdecoration'
    'qt6-base'
)
makedepends=(
    'base-devel'
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
    'kwin'
    'git'
)
source=("git+https://github.com/pearOS-archlinux/liquid-gel.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/liquid-gel"
    rm -rf build
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make -j$(nproc)
}

package() {
    cd "${srcdir}/liquid-gel/build"
    make DESTDIR="${pkgdir}" install

    # Verificare: fișierele obligatorii pentru Desktop Effects (Wayland)
    local plugindir="${pkgdir}/usr/lib/qt6/plugins"
    for f in \
        "${plugindir}/kwin/effects/plugins/forceblur.so" \
        "${plugindir}/kwin/effects/plugins/metadata.json" \
        "${plugindir}/kwin/effects/configs/pearos_liquidgel_config.so"; do
        if [[ ! -f "$f" ]]; then
            echo "EROARE: lipsește din pachet: $f"
            return 1
        fi
    done

    # Verificare opțională pentru X11 (instalat doar dacă kwin-x11 este disponibil)
    if [[ -d "${plugindir}/kwin-x11" ]]; then
        for f in \
            "${plugindir}/kwin-x11/effects/plugins/forceblur_x11.so" \
            "${plugindir}/kwin-x11/effects/plugins/metadata.json" \
            "${plugindir}/kwin-x11/effects/configs/pearos_liquidgel_config.so"; do
            if [[ ! -f "$f" ]]; then
                echo "AVERTISMENT: lipsește fișierul X11 opțional: $f"
            fi
        done
    fi
}

