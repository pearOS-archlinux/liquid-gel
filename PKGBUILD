# Maintainer: Your Name <your.email@example.com>
pkgname=pearos-liquidgel
pkgver=26.1
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
}

