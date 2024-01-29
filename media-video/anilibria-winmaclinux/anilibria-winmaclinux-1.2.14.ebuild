# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Anime viewer application from AniLibria (Qt Version)"
HOMEPAGE="https://github.com/anilibria/anilibria-winmaclinux"
SRC_URI="https://github.com/anilibria/anilibria-winmaclinux/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtmultimedia:5
	dev-qt/qtsvg:5
	dev-qt/qtwebsockets:5
	dev-qt/qtgraphicaleffects:5
	>=media-video/vlc-3.0.18
	>=dev-libs/openssl-1.1.1
	>=media-libs/gstreamer-1.10
	media-plugins/gst-plugins-libav
"

BDEPEND="
	>=sys-devel/gcc-11
"

PATCHES=(
	"${FILESDIR}/${PN}-1.2.12-remove-icons-48.patch"
	"${FILESDIR}/${PN}-1.2.12-fix-icons-path.patch"
)

src_unpack() {
	# Create build directory
	default_src_unpack
	mkdir -p "${S}"
}

src_configure() {
	eqmake5 DESTDIR="${S}" src/AniLibria.pro
	default_src_configure
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

