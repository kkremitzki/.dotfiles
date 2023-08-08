#!/usr/bin/env sh
set -e
SOURCE_DIR=$(dirname "$0")
STOW_DIR="${1:-dev}"
# TODO: Pull does not work in test environment without GH auth if host environment
# cloned dotfiles via SSH
GIT_DIR="${SOURCE_DIR}/.git" git pull
stow -d "${SOURCE_DIR}/${STOW_DIR}" -t ~ -R .
