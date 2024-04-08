# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A customizable and extensible shell"
HOMEPAGE="https://aylur.github.io/ags-docs/"
#SRC_URI="https://github.com/Aylur/ags"
SRC_URI="
        https://github.com/Aylur/ags/releases/download/v1.8.0/ags-v1.8.0.tar.gz -> ${P}.tar.gz
        https://github.com/Aylur/ags/releases/download/v1.8.0/node_modules-v1.8.0.tar.gz -> ${P}-modules.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
#IUSE="pulseaudio libsoup systemtray notify networkmanager powerprofiles upower bluetooth greetd"

RDEPEND="
dev-libs/gjs
dev-libs/gobject-introspection
gui-libs/gtk-layer-shell
x11-libs/gtk+:3
media-libs/libpulse
net-libs/libsoup
dev-libs/libdbusmenu
x11-libs/libnotify
net-misc/networkmanager
sys-power/power-profiles-daemon
sys-power/upower
net-wireless/gnome-bluetooth
"
# gui-libs/greetd
DEPEND="
${RDEPEND}
sys-libs/glibc
sys-libs/pam
"
BDEPEND="
dev-lang/typescript
dev-build/meson
"

S="${WORKDIR}/aylurs-gtk-shell"
BUILD_DIR="${S}/build"

src_prepare() {
	default
	mv ../node_modules .
}

src_configure() {
	meson_src_configure --libdir "lib/$PN"
}

src_install() {
	meson_src_install

	# Copy packaged NodeJS modules to the app dir
	insinto "/usr/share/com.github.Aylur.ags/"
	doins -r "node_modules"
}
