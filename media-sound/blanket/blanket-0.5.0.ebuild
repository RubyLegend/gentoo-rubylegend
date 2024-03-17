# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit meson ninja-utils python-single-r1 git-r3

DESCRIPTION="Listen to different sounds"
HOMEPAGE="https://github.com/rafaelmardojai/blanket"
EGIT_REPO_URI="https://github.com/rafaelmardojai/blanket.git"
# Fixing version at specific commit for now
# Because next commit moved to libadwaita 1.5, which is not packaged yet
EGIT_OVERRIDE_COMMIT_RAFAELMARDOJAI_BLANKET="529b780cf0f1e6d0f6600e8822ae51e552109f88"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-build/meson
	dev-python/pygobject
	gui-libs/gtk:4
	=gui-libs/libadwaita-1.4*
	media-libs/gstreamer
	dev-util/blueprint-compiler
"
RDEPEND="${DEPEND}"
