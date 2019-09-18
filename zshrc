
# needed at MPI because their version of zsh sucks
if [[ $(hostname -f) = mpipc*.mpi.zmaw.de ]]; then
   export FPATH=$LOCALPATH/share/zsh/5.2/functions
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $HOME/.zshrc-local

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
ZSH_THEME="cobalt2"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

if [[ -z $plugins ]]; then
  plugins=(git osx django virtualenvwrapper pip coding brew heroku pipenv shrink-path)
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

# https://cs-syd.eu/posts/2015-06-21-gtd-with-taskwarrior-part-2-collection
alias in='task add +in'
