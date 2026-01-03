# Maintainer: Your Name <your.email@example.com>
pkgname=kwin-effects-forceblur
pkgver=1.5.0
pkgrel=1
pkgdesc="Fork of the KWin Blur effect for KDE Plasma 6 with additional features (including force blur) and bug fixes"
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
source=("git+https://github.com/taj-ny/kwin-effects-forceblur.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/kwin-effects-forceblur"
    rm -rf build
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make -j$(nproc)
}

package() {
    cd "${srcdir}/kwin-effects-forceblur/build"
    make DESTDIR="${pkgdir}" install
}

