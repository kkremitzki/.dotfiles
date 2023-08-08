#!/usr/bin/env sh
# Dotfile automated deployment script. Example usage is simple remote dev host
# update via SSH plus this shell script.
set -e

SOURCE_DIR=$(dirname "$0")
STOW_DIR="${1:-dev}"
# TODO: Error handling will be needed for the scenario where that remote dev
# host has local changes, preventing the `git pull`.
# TODO: Pull does not work in test environment without GH auth if host environment
# cloned dotfiles via SSH. We could detect this and bail out early, for example
# looking for no SSH keys present yet a `url = git@github.com:...` line in git
# config.
GIT_DIR="${SOURCE_DIR}/.git" git pull
stow -d "${SOURCE_DIR}/${STOW_DIR}" -t ~ -R .
