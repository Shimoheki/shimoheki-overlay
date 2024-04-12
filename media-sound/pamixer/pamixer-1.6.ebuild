# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pulseaudio command line mixer"
HOMEPAGE="https://github.com/cdemoulins/pamixer"
SRC_URI="https://github.com/cdemoulins/pamixer/archive/${PV}.tar.gz -> ${P}.tar.gz"

inherit meson

LICENSE="GPL-3"
SLOT=0
KEYWORDS="~amd64 ~x86"

RDEPEND="
		dev-libs/cxxopts
		media-libs/libpulse
"

DEPEND="${RDEPEND}"
