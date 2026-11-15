#!/bin/bash

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

# Fail fast with a concise message when not using bash (e.g. `sh install.sh`)
# Single brackets are needed here for POSIX compatibility
# shellcheck disable=SC2292
if [ -z "${BASH_VERSION:-}" ]
then
  abort "Bash is required to interpret this script."
fi

# git ships with the Xcode Command Line Tools, so they must come first
echo "Checking for Xcode Command Line Tools..."
if xcode-select -p >/dev/null 2>&1; then
  echo "✓ Command Line Tools already installed at $(xcode-select -p)"
else
  echo "Installing Command Line Tools, follow the dialog that just opened..."
  xcode-select --install >/dev/null 2>&1
  until xcode-select -p >/dev/null 2>&1; do
    sleep 5
  done
  echo "✓ Command Line Tools installed"
fi

command -v git >/dev/null 2>&1 || abort "git still not available after installing the Command Line Tools."

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

printf "\nSetting up homebrew on path...\n"
eval "$(/opt/homebrew/bin/brew shellenv)"

DEFAULT_DOTFILES_PATH="$HOME/.dotfiles"
if [ -z "$1" ]; then
  DOTFILES_INSTALL_PATH="$DEFAULT_DOTFILES_PATH"
  printf "\ndotfiles path not set, using default (%s)\n" "$DOTFILES_INSTALL_PATH"
else
  DOTFILES_INSTALL_PATH="$1"
  printf "\ndotfiles will be installed on %s\n" "$DOTFILES_INSTALL_PATH"
fi

# checking if dir already exists
if [ -d "$DOTFILES_INSTALL_PATH" ]; then
  abort "$DOTFILES_INSTALL_PATH already exists, remove it before trying again."
fi

git clone https://github.com/devsdmf/dotfiles.git "$DOTFILES_INSTALL_PATH" || abort "Failed to clone dotfiles."

printf "\nDONE! The environment is ready to be set up, hit a key to continue with the installation...\n"
read -r -n 1 -s

cd "$DOTFILES_INSTALL_PATH" && make darwin
