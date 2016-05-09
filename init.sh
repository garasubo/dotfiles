if [ ! -e $HOME/.vimrc ]; then
    ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
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

if [ ! -e $HOME/.vim/repos/github.com/Shougo/dein.vim ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim
fi

