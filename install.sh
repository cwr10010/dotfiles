#!/usr/bin/env bash

if [ "$BASH" = "/bin/sh" ]
then
	# continue
else
	echo "BASH is not the default Burnshell, exit"
	exit 1
fi

SYSTEM=`uname -s`

DATE=`date +"%s"`

case "$SYSTEM" in

    Darwin) echo "Found Darwin environment"
        if [ ! -e `which brew` ]
            then
            echo "Brew not found"
            exit 2
        fi
        brew install macvim --with-override-system-vim --with-lua --with-luajit --with-luajit --with-cscope
        brew install python libevent tmux git reattach-to-user-namespace maven \
			tree grep ssh-copy-id wakeonlan wget xz sqlite urlview uptime psutils cmake
        ;;
    Linux) echo "Found Linux environment"
        # think about checking if tmux, vim and stuff are installed
        ;;
    *) echo "Unknown System"
        ;;

esac

function create_if_not_exists() {
	if [ ! -d $1 ]
	then
	    mkdir $1
	fi
}

function backup_if_exists() {
    if [ -e $1 ]
    then
      mv $1 $1.$DATE
    fi
}

function create_symlink() {
    backup_if_exists $2
    echo "Creating symlink for $1 to $2"
    ln -s $1 $2
}

git clone https://github.com/cwr10010/dotfiles.git ~/.dotfiles

create_if_not_exists ~/.config
create_symlink ~/.dotfiles/config/powerline ~/.config/powerline
pip install --upgrade --user git+git://github.com/powerline/powerline

create_symlink ~/.dotfiles/vimrc ~/.vimrc
rm -rf ~/.vim/bundle/*
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

create_symlink ~/.dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh ~/.tmux/plugins/tpm/bin/install_plugins

if [ -d ~/.oh-my-zsh ]
then
    create_if_not_exists ~/.oh-my-zsh/custom/
    create_symlink ~/.dotfiles/zshrc ~/.zshrc
    create_symlink ~/.dotfiles/zsh_custom/themes ~/.oh-my-zsh/custom/themes
else
  echo "Oh-my-zsh not found, skip setup"
fi

exit 0
