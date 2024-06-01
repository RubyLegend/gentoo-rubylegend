# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT=8.0

inherit dotnet-pkg

DESCRIPTION="Simple web server for streaming torrent files in video players (like VLC, MPC-HC and so on) "
HOMEPAGE="https://github.com/trueromanus/TorrentStream"
SRC_URI="https://github.com/trueromanus/TorrentStream/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DOTNET_PKG_PROJECTS=( src/TorrentStream.csproj )
DOCS=( README.md )

IUSE=""

BDEPEND="
|| (
	>=dev-dotnet/dotnet-sdk:8.0
	>=dev-dotnet/dotnet-sdk-bin:8.0
)
"
