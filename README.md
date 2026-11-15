# devsdmf - dotfiles

A comprehensive collection of dotfiles and system configuration for macOS and Linux environments.

## Features

- **Cross-platform support**: macOS (Darwin), Linux (Debian-based) and Amazon Linux
- **Automated setup**: Simple Makefile-based installation
- **Comprehensive tooling**: Configurations for development tools and terminal environments
- **Modular structure**: Organized by application and platform

## Included Configurations

- **Terminal**: Alacritty terminal emulator
- **Shell**: Zsh with custom configurations
- **Editors**: Vim and Neovim configurations
- **Version Control**: Git configuration and aliases
- **Terminal Multiplexer**: tmux setup
- **Package Management**: Homebrew (macOS), APT (Debian) and dnf (Amazon Linux) package lists
- **Platform-specific**: Darwin and Linux specific configurations

## Installation

### Prerequisites

- Git
- Make
- Appropriate package manager for your platform (Homebrew for macOS, APT for Debian, dnf/yum for Amazon Linux)

### One-line install (new macOS)

On a fresh Mac (Apple Silicon) you don't need anything installed beforehand. This script installs the Xcode
Command Line Tools (for `git` and `make`) and Homebrew, clones this repository and runs `make darwin`:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/devsdmf/dotfiles/refs/heads/main/setup/darwin/install.sh)"
```

The repository is cloned to `~/.dotfiles` by default. To clone it somewhere else, pass the path after a `_`
placeholder (with `bash -c`, the first argument becomes `$0`):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/devsdmf/dotfiles/refs/heads/main/setup/darwin/install.sh)" _ ~/Projects/devsdmf/dotfiles
```

The target folder must not exist yet. The setup stops a few times for input: the Command Line Tools dialog,
Homebrew's password prompt, a keypress before `make darwin`, and the manual Alacritty install.

### Quick Start

1. Clone the repository:
```bash
git clone https://github.com/devsdmf/dotfiles.git
cd dotfiles
```

2. Run the setup for your platform:

**For macOS:**
```bash
make darwin
```

**For Linux (Debian-based):**
```bash
make debian
```

**For Amazon Linux (2023, best effort on 2):**
```bash
make amzn
```

This is meant for headless VMs: it skips Alacritty and the fonts, installs fzf and diff-so-fancy from git,
and builds stow from source if the repositories don't have it.

### Manual Installation

You can also run the default target to see available options:
```bash
make
```

## Directory Structure

```
.
├── alacritty-darwin/   # Alacritty terminal configuration (macOS)
├── alacritty-debian/   # Alacritty terminal configuration (Debian/Ubuntu)
├── apt/                # APT package configurations
├── dnf/                # Amazon Linux package list (.dnf-packages)
├── gitconfig/          # Git configuration files
├── homebrew/           # Homebrew package list (.Brewfile)
├── nvim/               # Neovim configuration
├── oh-my-zsh/          # Custom Oh My Zsh theme (symlinked into ~/.oh-my-zsh/custom/themes)
├── setup/              # Setup scripts and Makefiles
├── tmux/               # tmux configuration
├── vim/                # Vim configuration
└── zsh/                # Zsh shell configuration (single .zshrc for macOS and Linux)
```

### Shell load order

`.zshrc` is the only shell file. It loads, in order:

1. `~/.zshrc.local.pre` (machine-specific, not versioned)
2. Environment, Homebrew, Oh My Zsh, fzf and aliases
3. `~/.zshrc.local.post` (machine-specific, not versioned)
4. `~/.profile`, if an app created one (takes precedence over everything above)

### Alacritty on macOS

The Homebrew cask was disabled because Alacritty fails the Gatekeeper check. `make darwin` pauses and asks you to
download it from the [releases page](https://github.com/alacritty/alacritty/releases) into `/Applications`.

## Customization

The dotfiles are designed to be easily customizable:

1. **Application-specific configs**: Each application has its own directory with relevant configuration files
2. **Platform-specific settings**: Darwin and Linux directories contain platform-specific configurations
3. **Modular setup**: The setup process is modular, allowing you to pick and choose components

## Usage

After installation, the configurations will be automatically applied to your system. Key features include:

- Enhanced terminal experience with Alacritty
- Powerful shell environment with Zsh
- Optimized editor configurations for Vim/Neovim
- Streamlined Git workflow with custom aliases
- Efficient terminal multiplexing with tmux

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on both macOS and Linux if possible
5. Submit a pull request

## Troubleshooting

If you encounter issues:

1. Ensure all prerequisites are installed
2. Check that you're running the correct make target for your platform
3. Review the setup logs for any error messages
4. Verify file permissions are correct

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For questions, issues, or contributions, please use the project's issue tracker.
