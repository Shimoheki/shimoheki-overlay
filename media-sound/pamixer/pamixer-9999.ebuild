# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pulseaudio command line mixer"
HOMEPAGE="https://github.com/cdemoulins/pamixer"

inherit git-r3 meson

EGIT_REPO_URI="https://github.com/cdemoulins/pamixer"

LICENSE="GPL-3"
SLOT=0
RESTRICT="mirror"

RDEPEND="
		dev-libs/cxxopts
		media-sound/pulseaudio
"

DEPEND="${RDEPEND}"

#src_install() {
#	dobin ${PN}
#	dodoc README.rst
#}
