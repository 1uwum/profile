#!/usr/bin/env sh

if [ ! -d "${XDG_CONFIG_HOME}/npm" ]; then
	mkdir "${XDG_CONFIG_HOME}/npm"
fi

if [ ! -d "${XDG_DATA_HOME}/npm" ]; then
	mkdir "${XDG_DATA_HOME}/npm"
fi

if [ ! -d "${XDG_CACHE_HOME}/npm" ]; then
	mkdir "${XDG_CACHE_HOME}/npm"
fi
var "NVM_DIR" "${XDG_DATA_HOME}/nvm"
var "NVM_LAZY_LOAD" "true"
var "NPM_CONFIG_USERCONFIG" "${XDG_CONFIG_HOME}/npm/npmrc"
var "NPM_CONFIG_INIT_MODULE" "${XDG_DATA_HOME}/npm/npm-init.js"
var "NPM_CONFIG_CACHE" "${XDG_CACHE_HOME}/npm"
var "PATH" "$XDG_BIN_HOME/yarn/bin:$PATH"
