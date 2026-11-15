# sourcing pre zshrc file
if [[ -s $HOME/.zshrc.local.pre ]]; then
  source $HOME/.zshrc.local.pre
fi

##### ENVIRONMENT

# user binaries
export PATH="$HOME/.local/bin:$PATH"
[[ -d $HOME/bin ]] && export PATH="$HOME/bin:$PATH"

# setting up locale
export LC_ALL=en_US.UTF-8

# setting up default ssh key
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# setting up editor
export EDITOR='nvim'

# homebrew (macOS)
if [[ $OSTYPE == darwin* && -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # disable homebrew auto-update
  export HOMEBREW_NO_AUTO_UPDATE=1

  # zsh-completions (must be on fpath before oh-my-zsh runs compinit)
  fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)
fi

# rust
[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

# fzf installed from git (linux)
[[ -d $HOME/.fzf/bin ]] && export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

##### OH MY ZSH

# path to zsh installation
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

# setting up zsh theme
ZSH_THEME="devsdmf"

# tmux configuration
export ZSH_TMUX_AUTOSTART=true

# setting up zsh plugins
# autostart tmux only inside alacritty
# (macOS exposes the app bundle id; on linux alacritty sets TERM/ALACRITTY_WINDOW_ID)
if [[ $OSTYPE == darwin* ]]; then
  [[ $__CFBundleIdentifier = 'org.alacritty' ]] && is_alacritty=1
else
  [[ $TERM = 'alacritty' || -n $ALACRITTY_WINDOW_ID ]] && is_alacritty=1
fi

if [[ -n $is_alacritty ]]; then
  plugins=(git git-prompt tmux)
else
  plugins=(git git-prompt)
fi
unset is_alacritty

# starting up zsh
source $ZSH/oh-my-zsh.sh

##### FZF

# completion and key bindings (after oh-my-zsh, which otherwise rebinds ^R)
if command -v fzf >/dev/null 2>&1; then
  if fzf --zsh >/dev/null 2>&1; then
    source <(fzf --zsh)
  else
    # older fzf (e.g. debian packages) ships the scripts instead of `fzf --zsh`
    for fzf_dir in "$HOME/.fzf/shell" /usr/share/doc/fzf/examples /usr/share/fzf; do
      if [[ -f $fzf_dir/key-bindings.zsh ]]; then
        source "$fzf_dir/key-bindings.zsh"
        [[ -f $fzf_dir/completion.zsh ]] && source "$fzf_dir/completion.zsh"
        break
      fi
    done
    unset fzf_dir
  fi
fi

##### ALIASES

# git
alias gsq='git rebase -i $(git merge-base HEAD $(git_main_branch))'
alias gcb='git_current_branch'

# preview files in command line using bat and fzf
command -v bat >/dev/null 2>&1 && alias preview="fzf --preview 'bat --color \"always\" {}'"

# replacements
command -v prettyping >/dev/null 2>&1 && alias ping='prettyping --nolegend'
command -v htop >/dev/null 2>&1 && alias top="sudo htop"
command -v ncdu >/dev/null 2>&1 && alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

##### LOCAL OVERRIDES

# sourcing post zshrc file
if [[ -s $HOME/.zshrc.local.post ]]; then
  source $HOME/.zshrc.local.post
fi

# apps sometimes create ~/.profile on their own; it takes precedence over everything above
if [[ -s $HOME/.profile ]]; then
  source $HOME/.profile
fi
