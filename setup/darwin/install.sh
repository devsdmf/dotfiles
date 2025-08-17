#!/bin/sh

# Fail fast with a concise message when not using bash
# Single brackets are needed here for POSIX compatibility
# shellcheck disable=SC2292
if [ -z "${BASH_VERSION:-}" ]
then
  abort "Bash is required to interpret this script."
fi

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\nSetting up homebrew on path..."
eval "$(/opt/homebrew/bin/brew shellenv)"

DEFAULT_DOTFILES_PATH="$HOME/.dotfiles"
if [ -z "$1" ]; then
  DOTFILES_INSTALL_PATH="$DEFAULT_DOTFILES_PATH"
  echo "\ndotfiles path not set, using default ($DOTFILES_INSTALL_PATH)"
else
  DOTFILES_INSTALL_PATH="$1"
  echo "\ndotfiles will be installed on $DOTFILES_INSTALL_PATH"
fi

# checking if dir already exists
if [ -d "$DOTFILES_INSTALL_PATH" ]; then
  echo "$DOTFILES_INSTALL_PATH already exists, remove it before trying again."
  exit 1
fi

git clone https://github.com/devsdmf/dotfiles.git $DOTFILES_INSTALL_PATH

echo "\nDONE! The environment is ready to be set up, hit a key continue with the installation..."
read -r -n 1 -d ''

cd "$DOTFILES_INSTALL_PATH" && make darwin
