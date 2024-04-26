# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

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
IUSE="bluetooth greetd dbusmenu +soup libnotify networkmanager powerprofile battery"

REQUIRED_USE=""

RDEPEND="
	sys-libs/glibc
	sys-libs/pam
	dev-libs/gjs
	dev-libs/gobject-introspection
	gui-libs/gtk-layer-shell[introspection]
	x11-libs/gtk+:3
	media-libs/libpulse
	bluetooth? ( >=net-wireless/gnome-bluetooth-42 )
	greetd? ( gui-libs/greetd )
	dbusmenu? ( dev-libs/libdbusmenu[gtk3] )
	soup? ( net-libs/libsoup )
	libnotify? ( x11-libs/libnotify )
	networkmanager? ( net-misc/networkmanager )
	powerprofile? ( sys-power/power-profiles-daemon )
	battery? ( sys-power/upower )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/gobject-introspection
	dev-build/meson
	net-libs/nodejs
	dev-lang/typescript
"

S="${WORKDIR}/ags"
BUILD_DIR="${S}/build"
MYMESONARGS="-Dbuild_types=true"

src_prepare() {
	default
	mv ../node_modules .
}

src_configure() {
	meson_src_configure --libdir "lib/$PN"
}

src_install() {
	meson_src_install

	insinto "/usr/share/com.github.Aylur.ags/"
	dosym /usr/share/com.github.Aylur.ags/com.github.Aylur.ags /usr/bin/ags
}
