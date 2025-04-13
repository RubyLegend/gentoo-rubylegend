# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT=8.0
NUGETS="
microsoft.extensions.hosting.systemd@8.0.0
microsoft.extensions.hosting.windowsservices@8.0.0
monotorrent@3.0.0-beta.rev0106
microsoft.dotnet.ilcompiler@8.0.5
microsoft.extensions.hosting@8.0.0
microsoft.extensions.logging.eventlog@8.0.0
system.serviceprocess.servicecontroller@8.0.0
mono.nat@3.0.0
reusabletasks@2.0.2
runtime.linux-x64.microsoft.dotnet.ilcompiler@8.0.5
microsoft.extensions.configuration.abstractions@8.0.0
microsoft.extensions.configuration.binder@8.0.0
microsoft.extensions.configuration.commandline@8.0.0
microsoft.extensions.configuration.environmentvariables@8.0.0
microsoft.extensions.configuration.fileextensions@8.0.0
microsoft.extensions.configuration.json@8.0.0
microsoft.extensions.configuration.usersecrets@8.0.0
microsoft.extensions.configuration@8.0.0
microsoft.extensions.dependencyinjection.abstractions@8.0.0
microsoft.extensions.dependencyinjection@8.0.0
microsoft.extensions.diagnostics@8.0.0
microsoft.extensions.fileproviders.abstractions@8.0.0
microsoft.extensions.fileproviders.physical@8.0.0
microsoft.extensions.hosting.abstractions@8.0.0
microsoft.extensions.logging.abstractions@8.0.0
microsoft.extensions.logging.configuration@8.0.0
microsoft.extensions.logging.console@8.0.0
microsoft.extensions.logging.debug@8.0.0
microsoft.extensions.logging.eventsource@8.0.0
microsoft.extensions.logging@8.0.0
microsoft.extensions.options@8.0.0
system.diagnostics.eventlog@8.0.0
microsoft.extensions.primitives@8.0.0
system.text.json@8.0.0
microsoft.extensions.diagnostics.abstractions@8.0.0
microsoft.extensions.options.configurationextensions@8.0.0
microsoft.extensions.filesystemglobbing@8.0.0
system.text.encodings.web@8.0.0
system.diagnostics.diagnosticsource@8.0.0
"

inherit dotnet-pkg

DESCRIPTION="Simple web server for streaming torrent files in video players (like VLC, MPC-HC and so on) "
HOMEPAGE="https://github.com/trueromanus/TorrentStream"
SRC_URI="https://github.com/trueromanus/TorrentStream/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" ${NUGET_URIS} "
S="${WORKDIR}/${P}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DOTNET_PKG_PROJECTS=( src/TorrentStream.csproj )
DOCS=( README.md )

IUSE=""

BDEPEND="
|| (
	dev-dotnet/dotnet-sdk:8.0
	dev-dotnet/dotnet-sdk-bin:8.0
)
"

src_install() {
	dotnet-pkg-base_install
	dotnet-pkg-base_dolauncher "/usr/share/${P}/TorrentStream" TorrentStream

	einstalldocs
}
