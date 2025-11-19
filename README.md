# Unofficial Erlang Archives

## What is this?

`erlang-builds` provides a dependency-free distribution of [Erlang/OTP](https://github.com/erlang/otp) for Linux. This makes it extremely easy to install and distribute, especially when building releases.

## Variants

We provide 3 variants for each OTP release:

- *-glibc*: glibc is the most commonly used libc flavour. Glibc is the basis for almost all popular distributions like Debian, Ubuntu, Arch Linux, Fedora, RHEL, OpenSUSE, and many more.

- *-musl*: musl is a lightweight alternative to glibc used in distributations like Alpine Linux.

- *static* (no suffix): The statically linked variant has zero external dependencies and works regardless of distributation or libc flavour. Keep in mind that an Erlang distribution includes some shell scripts. These are used by default to setup an environment but are otherwise optional. It can run even on NixOS or minimal docker containers. Unfortunately, statically linking makes using NIFs and driver plugins impossible; see below for more information.

## What is included?

All variants statically link with ncurses, OpenSSL and zlib. This makes almost all of OTP available, except for the following applications:

- `jinterface`
- `odbc`
- `wx` and dependents: `debugger` and `observer`. Note that `et` and `reltool` also come with modules that require `wx`; these will not work.

Documentation and Examples are removed. Refer to the [online documentation](https://www.erlang.org/doc/readme.html) instead.

Additionally, the Tarball also includes a prebuilt version of [rebar3](https://github.com/erlang/rebar3). The installed packages on the build system are written into a file called `versions.txt` that is included in the archive.

## What about NIFs?

Unfortunately, there is no supported way to load dynamic libraries from a static binary on Linux. The dynamically linked variants for `glibc` and `musl` can be used instead (see above for more information).

Once you start using NIFs it's maybe also a good time to start considering using a "full" Erlang installation, or finding an alternative by using pure Erlang libraries, ports, or C nodes.

## Windows and MacOS

The official Windows and Mac binaries provided by [erlang](https://www.erlang.org/downloads) already have no extra dependencies. You can also install them using various package managers like [Homebrew](https://brew.sh/) or [Chocolatey](https://chocolatey.org/).
