# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="SteamVR plugin to use OpenHMD drivers in SteamVR"
HOMEPAGE="https://github.com/ChristophHaag/SteamVR-OpenHMD"
EGIT_REPO_URI="https://github.com/ChristophHaag/SteamVR-OpenHMD.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/cmake
	dev-libs/hidapi
"

src_prepare() {
	sed -i 's|DESTINATION lib|DESTINATION lib64|g' "subprojects/openhmd/CMakeLists.txt" || die "Patch lib64 failed"
	sed -i 's|${CMAKE_BINARY_DIR}/|${CMAKE_BINARY_DIR}/subprojects/openhmd/|g' "subprojects/openhmd/CMakeLists.txt" || die "patch .pc file failed"
	cmake_src_prepare
}

src_install() {
	dodir /usr/local/bin/
	cp -R "${S}/paths.sh" "${S}/register.sh" "${S}/unregister.sh" "${D}/usr/local/bin/" || die "Install failed."
	cp -R "${WORKDIR}/bin/linux64/driver_openhmd.so" "${D}/usr/lib64/" || die "Install failed."
	# FIXME Install and patch all scripts (Later)
}
