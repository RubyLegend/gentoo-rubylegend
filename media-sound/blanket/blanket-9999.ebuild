# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit meson ninja-utils python-single-r1 git-r3

DESCRIPTION="Listen to different sounds"
HOMEPAGE="https://github.com/rafaelmardojai/blanket"
EGIT_REPO_URI="https://github.com/rafaelmardojai/blanket.git"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-util/meson
	dev-python/pygobject
	gui-libs/gtk:4
	gui-libs/libadwaita
	media-libs/gstreamer
"
RDEPEND="${DEPEND}"
