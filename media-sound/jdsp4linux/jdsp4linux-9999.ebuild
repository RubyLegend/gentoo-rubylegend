# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils xdg-utils

DESCRIPTION="An audio effect processor for PipeWire and PulseAudio clients "
HOMEPAGE="https://github.com/Audio4Linux/JDSP4Linux"
EGIT_REPO_URI="https://github.com/Audio4Linux/JDSP4Linux.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="
	app-arch/libarchive
	dev-qt/qtcore
	dev-qt/qtsvg
	dev-libs/glib
	dev-cpp/glibmm
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/gcc
	sys-devel/make
	virtual/pkgconfig
	media-video/pipewire
	dev-qt/linguist-tools
"

src_prepare() {
	sed -i "s|lrelease|$(qt5_get_bindir)/lrelease|g" JDSP4Linux.pro || die
	sed -i "s|lupdate|$(qt5_get_bindir)/lupdate|g" JDSP4Linux.pro || die
	default
}

src_configure() {
	eqmake5 PREFIX="/usr"
}

src_install () {
	emake install INSTALL_ROOT="${D}"
	einstalldocs
	mkdir -p "${D}/usr/share/applications/"
	mkdir -p "${D}/usr/share/icons/hicolor/scalable/apps/"
	cp "${WORKDIR}/${P}/resources/icons/icon.svg" "${D}/usr/share/icons/hicolor/scalable/apps/jamesdsp.svg"
	cat <<EOT >> ${D}/usr/share/applications/jamesdsp.desktop
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
EOT

}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
