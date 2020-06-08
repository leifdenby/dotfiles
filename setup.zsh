cd $HOME/.dotfiles
git submodule init
git submodule update

for f in "vimrc" "zshrc" "gitconfig" "vim" "oh-my-zsh" "ctags" "taskrc"; do
	if [[ -e "$HOME/.$f" ]] ; then
		rm "$HOME/.$f"
	fi
	ln -s $HOME/.dotfiles/$f $HOME/.$f
done
vim +PlugInstall +qall # installs fzf

wget https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme oh-my-zsh/themes/
ln -s $HOME/.dotfiles/gdbinit/gdbinit $HOME/.gdbinit

ln -s $HOME/.dotifles/hammerspoon $HOME/.hammerspoon
