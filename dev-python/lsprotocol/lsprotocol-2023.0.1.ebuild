# Copyright 2025-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..13} pypy3 pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Code generator and generated types for Language Server Protocol."
HOMEPAGE="
	https://github.com/microsoft/lsprotocol/
	https://pypi.org/project/lsprotocol/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
