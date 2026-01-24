# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit meson ninja-utils python-single-r1 git-r3

DESCRIPTION="Listen to different sounds"
HOMEPAGE="https://github.com/rafaelmardojai/blanket"
EGIT_REPO_URI="https://github.com/rafaelmardojai/blanket.git"

# Locking commit for now due to change in libadwaita version, which is not published yet
#EGIT_OVERRIDE_COMMIT_RAFAELMARDOJAI_BLANKET="a961c1faeab69a61605b8733692b709ab5d2f09f"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-build/meson
	dev-build/ninja
	dev-python/pygobject
	gui-libs/gtk:4
	>=gui-libs/libadwaita-1.7
	media-libs/gstreamer
	dev-util/blueprint-compiler
"
RDEPEND="${DEPEND}"

src_install() {
	meson_src_install
	python_fix_shebang "${ED}"/usr/bin/blanket
	default_src_install
}
