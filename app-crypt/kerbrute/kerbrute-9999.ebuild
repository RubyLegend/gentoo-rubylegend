# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="A tool to perform Kerberos pre-auth bruteforcing"
HOMEPAGE="https://github.com/ropnop/kerbrute"
EGIT_REPO_URI="https://github.com/ropnop/kerbrute.git"

LICENSE="Apache-2.0"
SLOT="0"

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"

src_compile() {
	emake linux || die "Compilation failed."
}

src_install() {
	mkdir -p "${D}/usr/bin/"
	cp "${S}/dist/kerbrute_linux_amd64" "${D}/usr/bin/kerbrute" || die "Installation failed."
}
