# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="KDAB's Dock Widget Framework for Qt"
HOMEPAGE="https://github.com/KDAB/KDDockWidgets"
EGIT_REPO_URI="https://github.com/KDAB/KDDockWidgets.git"

SLOT="0"

LICENSE="GPL-3"
DEPEND="
	dev-qt/qtcore
	dev-qt/qtwidgets
	dev-qt/qtx11extras
	dev-qt/qtquickcontrols
	dev-qt/qtquickcontrols2
"
RDEPEND="${DEPEND}"
BDEPEND="
    dev-build/cmake
	app-alternatives/ninja
	sys-devel/gcc
"
