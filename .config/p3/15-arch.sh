#!/usr/bin/env sh

# Where to download source package files from AUR.
var "SRCDEST" "${XDG_DATA_HOME}/src"
[ ! -d "$SRCDEST" ] && mkdir "$SRCDEST"

# Where to store packages after they have been built.
var "PKGDEST" "${XDG_VAR_HOME}/aur"
[ ! -d "$PKGDEST" ] && mkdir "$PKGDEST"

# Where to store after packaging source files?
var "SRCPKGDEST" "${HOME}/.local/dist"
[ ! -d "$SRCPKGDEST" ] && mkdir $SRCPKGDEST

# Where aur packages are built.
var "BUILDDIR" "${XDG_BUILD_HOME}"
[ ! -d "$BUILDDIR" ] && mkdir "$BUILDDIR"

# Where to clone package build files ( old pacaur variable )
var "AURDEST" "${HOME}/Workspace"
[ ! -d "$AURDEST" ] && mkdir "$AURDEST"
