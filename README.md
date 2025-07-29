# devsdmf - dotfiles

A comprehensive collection of dotfiles and system configuration for macOS and Linux environments.

## Features

- **Cross-platform support**: macOS (Darwin) and Linux (Debian-based)
- **Automated setup**: Simple Makefile-based installation
- **Comprehensive tooling**: Configurations for development tools and terminal environments
- **Modular structure**: Organized by application and platform

## Included Configurations

- **Terminal**: Alacritty terminal emulator
- **Shell**: Zsh with custom configurations
- **Editors**: Vim and Neovim configurations
- **Version Control**: Git configuration and aliases
- **Terminal Multiplexer**: tmux setup
- **Package Management**: Homebrew (macOS) and APT (Linux) configurations
- **Platform-specific**: Darwin and Linux specific configurations

## Installation

### Prerequisites

- Git
- Make
- Appropriate package manager for your platform (Homebrew for macOS, APT for Linux)

### Quick Start

1. Clone the repository:
```bash
git clone <repository-url>
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

### Manual Installation

You can also run the default target to see available options:
```bash
make
```

## Directory Structure

```
.
├── alacritty/          # Alacritty terminal configuration
├── apt/                # APT package configurations
├── darwin/             # macOS-specific configurations
├── gitconfig/          # Git configuration files
├── homebrew/           # Homebrew configurations
├── linux/              # Linux-specific configurations
├── nvim/               # Neovim configuration
├── setup/              # Setup scripts and Makefiles
├── tmux/               # tmux configuration
├── vim/                # Vim configuration
└── zsh/                # Zsh shell configuration
```

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
