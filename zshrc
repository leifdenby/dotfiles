
# needed at MPI because their version of zsh sucks
if [[ $(hostname -f) = mpipc*.mpi.zmaw.de ]]; then
   export FPATH=$LOCALPATH/share/zsh/5.2/functions
fi

DISABLE_AUTO_UPDATE=true
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
ZSH_THEME="cobalt2"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $HOME/.zshrc-local

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

prompt_dir() {
  #prompt_segment blue $CURRENT_FG '%~'
prompt_segment blue $CURRENT_FG '%2~'
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

if [[ -z $plugins ]]; then
  plugins=(git osx django pip coding brew heroku pipenv shrink-path)
fi

if [[ `uname` == "Linux" ]]; then
  alias open='xdg-open'
  alias open='gio open'
fi


source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export WORKON_HOME=$HOME/.virtualenvs

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PIP_USE_MIRRORS=1

# Don't use gnome's askpass ever
unset SSH_ASKPASS

# Radio

alias bbc3="mplayer http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_three.m3u8"

# https://cs-syd.eu/posts/2015-06-21-gtd-with-taskwarrior-part-2-collection
alias in='task add +in'
alias tadd-work="task add +@work"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias td='task ls lim:10 -BLOCKED'
# get a task summary
td

if [ -x "`which nvim`" ] ; then
  alias vim=nvim
fi
