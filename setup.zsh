for f in "vimrc" "zshrc" "gitconfig" "vim" "oh-my-zsh" "ctags"; do
	if [[ -e "$HOME/.$f" ]] ; then
		rm "$HOME/.$f"
	fi
	ln -s $HOME/.dotfiles/$f $HOME/.$f
done
