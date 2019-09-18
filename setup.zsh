cd $HOME/.dotfiles
git submodule init
git submodule update

for f in "vimrc" "zshrc" "gitconfig" "vim" "oh-my-zsh" "ctags" "taskrc-common"; do
	if [[ -e "$HOME/.$f" ]] ; then
		rm "$HOME/.$f"
	fi
	ln -s $HOME/.dotfiles/$f $HOME/.$f
done
vim +PlugInstall +qall # installs fzf

ln -s $HOME/.dotfiles/gdbinit/gdbinit $HOME/.gdbinit
