# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module git-r3

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
	 GOOS=linux GOARCH="amd64" go build -a -o "${S}/bin/kerbrute"
	 [[ -x bin/${PN} ]]|| die "${PN} build failed"
}

src_test() {
	go test -work "./..." || die
}

src_install() {
	dobin bin/${PN}
	dodoc -r README.md
}
