# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils xdg-utils

DESCRIPTION="An audio effect processor for PipeWire and PulseAudio clients"
HOMEPAGE="https://github.com/Audio4Linux/JDSP4Linux"
EGIT_REPO_URI="https://github.com/Audio4Linux/JDSP4Linux.git"
# Use all submodules except for Qt-Advanced-Docking-System (failing submodule init)
EGIT_SUBMODULES=( '*' '-src/subprojects/EELEditor/3rdparty/docking-system' )

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="qt6"

DEPEND="
	app-arch/libarchive
	dev-qt/qtcore
	dev-qt/qtsvg
	dev-libs/glib
	dev-cpp/glibmm:2
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/gcc
	dev-build/make
	virtual/pkgconfig
	media-video/pipewire
	dev-qt/linguist-tools
"

# Seems like not required anymore
# src_prepare() {
# 	sed -i "s|lrelease|$(usex qt6 $(qt6_get_bindir) $(qt5_get_bindir))/lrelease|g" JDSP4Linux.pro || die
# 	sed -i "s|lupdate|$(usex qt6 $(qt6_get_bindir) $(qt5_get_bindir))/lupdate|g" JDSP4Linux.pro || die
# 	default
# }

src_configure() {
	$(usex qt6 eqmake6 eqmake5) PREFIX="/usr"
}

src_install () {
	emake install INSTALL_ROOT="${D}"
	einstalldocs
	mkdir -p "${D}/usr/share/applications/"
	mkdir -p "${D}/usr/share/icons/hicolor/scalable/apps/"
	cp "${WORKDIR}/${P}/resources/icons/icon.svg" "${D}/usr/share/icons/hicolor/scalable/apps/jamesdsp.svg"
	cat <<EOF >> ${D}/usr/share/applications/jamesdsp.desktop
[Desktop Entry]
Name=JamesDSP
GenericName=Audio effect processor
Comment=JamesDSP for Linux
Keywords=equalizer;audio;effect
Categories=AudioVideo;Audio;
Exec=jamesdsp
Icon=/usr/share/icons/hicolor/scalable/apps/jamesdsp.svg
StartupNotify=false
Terminal=false
Type=Application
EOF

}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
