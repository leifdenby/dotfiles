if [[ ! -e "`which nvim`" ]]; then
  if [[ `uname` == "Linux" ]]; then
    mkdir -p $HOME/tools/ && cd $HOME/tools/
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    tar zxvf nvim-linux64.tar.gz
  else
    brew install neovim
  fi
fi

cd $HOME/.dotfiles
git submodule init
git submodule update

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#for f in "config/nvim" "zshrc" "gitconfig" "vim" "oh-my-zsh" "ctags" "taskrc"; do
for f in "config/nvim" "zshrc"; do
  if [[ -e "$HOME/.$f" ]] ; then
    if [[ -h "$HOME/.$f" ]] ; then
      # is symlink, skip
      continue
    elif [[ -d "$HOME/.$f" ]] ; then
      # is directory, remove
      rm "$HOME/.$f/*"
      rmdir "$HOME/.$f"
    elif [[ -f "$HOME/.$f" ]] ; then
      rm "$HOME/.$f"
    else
      echo "not sure what to do with $HOME/.$f"
      exit -1
    fi
  fi
  ln -s $HOME/.dotfiles/$f $HOME/.$f
done
vim +PlugInstall +qall # installs fzf

sh -c 'curl -fLo oh-my-zsh/themes/cobalt2.zsh-theme --create-dirs \
       https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme'

# ensure local files exist
touch ~/.zshrc-local
touch ~/.taskrc-local
