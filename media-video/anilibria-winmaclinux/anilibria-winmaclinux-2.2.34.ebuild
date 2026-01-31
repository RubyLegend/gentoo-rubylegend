# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils cmake ninja-utils

DESCRIPTION="Anime viewer application from AniLiberty (Qt Version)"
HOMEPAGE="https://github.com/anilibria/anilibria-winmaclinux"
SRC_URI="https://github.com/anilibria/anilibria-winmaclinux/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

CMAKE_USE_DIR="${S}/src"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

IUSE="qt6 vlc mpv"

DEPEND="
!qt6? (
	dev-qt/qtcore:5
	dev-qt/qtmultimedia:5
	dev-qt/qtsvg:5
	dev-qt/qtwebsockets:5
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtquickcontrols2:5
)
qt6? (
	dev-qt/qtbase:6
	dev-qt/qtmultimedia:6
	dev-qt/qtsvg:6
	dev-qt/qtwebsockets:6
)
vlc? ( >=media-video/vlc-3.0.18 )
mpv? ( media-video/mpv )
	>=dev-libs/openssl-1.1.1
	>=media-libs/gstreamer-1.10
	media-plugins/gst-plugins-libav
"

BDEPEND="
	>=sys-devel/gcc-11
"

src_unpack() {
	# Create build directory
	default_src_unpack
	sed -i "s|/usr/local/bin|/usr/bin|g" "${S}"/data/tv.aniliberty.AniLiberty.desktop
}


src_configure() {
	local myconfig=()
	for i in vlc mpv; do
		use ${i} && myconfig+=(unix${i})
	done

	cmake_src_configure
	default_src_configure
}

src_install() {
	DESTDIR="${D}" eninja -C "${CMAKE_USE_DIR}_build" install
	default_src_install
}

