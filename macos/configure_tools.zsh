#!/usr/bin/env zsh

local confd="$macos_dotfiles/conf.d"

source "$confd/toolchains.zsh"
source "$confd/clang-format.zsh"
source "$confd/starship.zsh"
source "$confd/esp-idf.zsh"
source "$confd/cargo.zsh"
source "$confd/npm.zsh"
source "$confd/stm32cubeprogrammer.zsh"