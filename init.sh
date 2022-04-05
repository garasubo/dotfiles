if [ ! -e $HOME/.vimrc ]; then
    ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
fi

if [ ! -e $HOME/.vim ]; then
    ln -s $HOME/dotfiles/vim $HOME/.vim
fi

if [ ! -e $HOME/.zshrc ]; then
    ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
fi

if [ ! -e $HOME/.zsh ]; then
    ln -s $HOME/dotfiles/zsh $HOME/.zsh
fi

if [ ! -e $HOME/.vimperatorrc ]; then
    ln -s $HOME/dotfiles/vimperatorrc $HOME/.vimperatorrc
fi

if [ ! -e $HOME/.ideavimrc ]; then
    ln -s $HOME/dotfiles/ideavimrc $HOME/.ideavimrc
fi

if [ ! -e $HOME/.tmux.conf ]; then
    ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
fi

if [ ! -e $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [ ! -e $HOME/.asdfrc ]; then
    ln -s $HOME/dotfiles/asdfrc $HOME/.asdfrc
fi


if [ ! -e $HOME/.vim/repos/github.com/Shougo/dein.vim ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim
fi

git submodule update --init --recursive
