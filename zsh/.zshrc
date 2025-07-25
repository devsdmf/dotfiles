# sourcing pre zshrc file
if [[ -s $HOME/.zshrc.local.pre ]]; then
  source $HOME/.zshrc.local.pre
fi

# running profile
if [[ -s $HOME/.profile ]]; then
  source $HOME/.profile
fi

# path to zsh installation 
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

# setting up zsh theme
ZSH_THEME="devsdmf"

# tmux configuration 
export ZSH_TMUX_AUTOSTART=true

# setting up zsh plugins
plugins=(git git-prompt tmux)

# starting up zsh
source $ZSH/oh-my-zsh.sh

# sourcing post zshrc file
if [[ -s $HOME/.zshrc.local.post ]]; then
  source $HOME/.zshrc.local.post
fi
