#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-2.0-or-later
# shellcheck shell=sh

progname='p3'
author='Idigo Luwum'
version='2.0.0'

set -a

P3_DIR="${P3_DIR:=${HOME}/.config/p3}"

usage() {
	cat <-EOF
	"$progname is very simple way to manage profile initialization in pure posix sh.

    Usage: p3 [OPTIONS] [P3_DIR]

    Where the default P3_DIR is ~/.config/p3
    "
	EOF
}

version() {
	echo $version
}

about() {
	cat <-EOF
	"Copyright (C) 2020 $author

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version."
	EOF
}

var() {
	# uppercase the environment variable.
	VAR=$(echo "$1" | tr "[:lower:]" "[:upper:]")
	if [ -z ${1:+} ]; then
		export "${VAR}=$2"
	fi
	unset VAR
}

p3() {
	if [ $# -eq 1 ]; then
		P3_DIR="$1"
	fi
	case "$@" in
	-v | --version)
		version
		exit 0
		;;
	-h | --help)
		usage
		about
		exit 0
		;;
	esac
	if [ ! -d "$P3_DIR" ]; then
		#Don't read from stdin in a non-interactive shell.
		case "$-" in
		*i*)
			printf "Directory %s does not exist. Create (yY/nN): " "$P3_DIR"
			read -r answer

			case "$answer" in
			y* | Y*)
				mkdir "$P3_DIR"
				;;
			*)
				echo "Directory $P3_DIR will not be created. Exiting..."
				exit 1
				;;
			esac
			;;
		esac
	fi
	for f in "${P3_DIR}"/*.sh; do
		if [ -r "$f" ]; then
			. "$f"
		fi
	done
	unset f
}

p3

unset -f about usage version p3
