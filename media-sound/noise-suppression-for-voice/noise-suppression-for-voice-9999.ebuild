# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake ninja-utils

DESCRIPTION="Noise suppression plugin based on Xiph's RNNoise"
HOMEPAGE="https://github.com/werman/noise-suppression-for-voice"
EGIT_REPO_URI="https://github.com/werman/noise-suppression-for-voice.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# TBD.
src_configure() {
	if [ ${ARCH} == "amd64" ]; then
		mycmakeargs += [-Bbuild-x64 -H. -GNinja]
	elif [ ${ARCH} == "x86" ]; then
		mycmakeargs += [-D CMAKE_CXX_FLAGS=-m32 -D CMAKE_C_FLAGS=-m32 -Bbuild-x32 -H. -GNinja]
	else
		die "Unknown architecute for this package: ${ARCH}"
	fi
}
