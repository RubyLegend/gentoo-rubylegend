# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Free and Open Source API and drivers for immersive technology. "
HOMEPAGE="https://github.com/OpenHMD/OpenHMD"
EGIT_REPO_URI="https://github.com/OpenHMD/OpenHMD.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/cmake
"

src_prepare() {
	sed -i 's|DESTINATION lib|DESTINATION lib64|g' CMakeLists.txt || die "sed failed"
	cmake_src_prepare
}
