# Unofficial Erlang Binaries

## What is this?

`gleam-community` provides a dependency-free distribution of [Erlang/OTP](https://github.com/erlang/otp) for Linux. This makes it extremely easy to install and distribute, especially when building releases. Head to [Releases](https://github.com/gleam-community/erlang-linux-builds/releases) to download the latest (or older) versions!

## Variants

We provide 3 variants for each OTP release, depending on which flavour of the C standard librar `libc` your distribution uses:

- **-glibc**: glibc is the most commonly used libc flavour. Glibc is the basis for almost all popular distributions like Debian, Ubuntu, Arch Linux, Fedora, RHEL, OpenSUSE, and many more.

- **-musl**: musl is a lightweight alternative  to glibc used in distributations like Alpine or Void Linux.

- **static** (no suffix): The statically linked variant has zero external dependencies and works regardless of distributation or libc flavour. It can run even in environments like NixOS or `from scratch` containers. Unfortunately, statically linking makes using NIFs and driver plugins impossible; see below for more information.

## What is included?

All variants statically link with ncurses, OpenSSL and zlib, which means they work out-of-the-box on any Linux system. They make almost all of OTP available, except for the following applications:

- `jinterface`
- `odbc`
- `wx` and dependents: `debugger` and `observer`. Note that `et` and `reltool` also include modules that require `wx`; these will not work.

Documentation and examples are removed. Refer to the [online documentation](https://www.erlang.org/doc/readme.html) instead.

Additionally, the archive includes a prebuilt version of [rebar3](https://github.com/erlang/rebar3). The installed packages on the build system are written into a file called `versions.txt` that is included in the archive.

## Usage

Download the right variant in the latest version from the [Releases](https://github.com/gleam-community/erlang-linux-builds/releases) page. The tarball does not include a top-level directory; this has been done to be compatible with Erlang/OTPs official releases. Once extracted, you will find all the files and directories included in the Erlang installation directory, typically inside `/usr/local/lib/erlang`. You can copy the files there, but you can also directly run the `./bin/erl` program from anywhere to enter an Erlang shell.

```sh
# Download the latest version
wget $RELEASE_URL

# Create a target directory
mkdir erlang

# Extract downloaded archive into that directory
tar -xf erlang-*.tar.gz -C erlang/

# Run an Erlang shell!
./erlang/bin/erl
```

## What about NIFs?

Unfortunately, there is no supported way to load dynamic libraries from a static binary on Linux. The dynamically linked variants for `glibc` and `musl` can be used instead (see above for more information).

Once you start using NIFs it's maybe also a good time to start considering using a "full" Erlang installation, or finding an alternative by using pure Erlang libraries, ports, or C nodes.

While I have some ideas on how to possibly support odbc in the future, wxWidgets will most likely never be supported. If you're looking for an an alternative to observer, [spectator](https://hexdocs.pm/spectator/index.html) or [Phoenix LiveDashboard](https://hexdocs.pm/phoenix_live_dashboard/Phoenix.LiveDashboard.html) can be used instead. 


## Windows and MacOS

The official Windows and Mac binaries provided by [Erlang](https://www.erlang.org/downloads) already have no extra dependencies. You can also install them using various package managers like [Homebrew](https://brew.sh/) or [Chocolatey](https://chocolatey.org/).
