#!/bin/sh
# Makes ~/.zshrc a machine-specific (unversioned) file that sources the shared ~/.devsdmf.zshrc first.
# Tools that append to ~/.zshrc (installers, CLIs) then only touch this machine's file.

ZSHRC="$HOME/.zshrc"
SOURCE_LINE='[[ -s $HOME/.devsdmf.zshrc ]] && source $HOME/.devsdmf.zshrc'

echo "Setting up machine-specific ~/.zshrc"

# older versions of these dotfiles stowed ~/.zshrc itself
if [ -L "$ZSHRC" ]; then
  case "$(readlink "$ZSHRC")" in
    *zsh/.zshrc)
      rm "$ZSHRC"
      echo "✓ Removed the old ~/.zshrc symlink to the dotfiles repo"
      ;;
    *)
      echo "✗ ~/.zshrc is a symlink to $(readlink "$ZSHRC"), leaving it alone"
      echo "  Add this line at its top yourself: $SOURCE_LINE"
      exit 0
      ;;
  esac
fi

if [ ! -e "$ZSHRC" ]; then
  {
    echo "# machine-specific zsh config, not versioned"
    echo "# the shared config lives in ~/.devsdmf.zshrc (devsdmf/dotfiles)"
    echo "$SOURCE_LINE"
    echo ""
  } > "$ZSHRC"
  echo "✓ Created ~/.zshrc sourcing ~/.devsdmf.zshrc"
elif grep -qF '.devsdmf.zshrc' "$ZSHRC"; then
  echo "✓ ~/.zshrc already sources ~/.devsdmf.zshrc"
else
  cp "$ZSHRC" "$ZSHRC.pre-devsdmf"
  {
    echo "# the shared config lives in ~/.devsdmf.zshrc (devsdmf/dotfiles)"
    echo "$SOURCE_LINE"
    echo ""
    cat "$ZSHRC.pre-devsdmf"
  } > "$ZSHRC"
  echo "✓ Added ~/.devsdmf.zshrc to the top of the existing ~/.zshrc"
  echo "  Backup saved to ~/.zshrc.pre-devsdmf; review the rest of the file for duplicated setup"
fi
