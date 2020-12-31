#!/usr/bin/env bash

echo "This requires Xcode Commandline Tools to be installed"
echo -n "(y/n) "
read xctinstalled

if [ "$xctinstalled" != "y" ]
then
	echo "exiting..."
	exit 1
fi

if [ "$BASH" != "/bin/bash" ]
then
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
        brew install python3 ruby graphviz harfbuzz coreutils libevent tmux \
			git reattach-to-user-namespace maven tree ssh-copy-id wakeonlan \
			wget xz sqlite urlview uptime psutils alacritty nvim

		export TEXMF_LOCATION=Library/
        ;;
    Linux) echo "Found Linux environment"
        # think about checking if tmux, vim and stuff are installed
        ;;
    *) echo "Unknown System! Bailing out..."; exit 1
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
#create_symlink ~/.dotfiles/config/powerline ~/.config/powerline
create_symlink ~/.dotfiles/config/alacritty ~/.config/alacritty
create_symlink ~/.dotfiles/config/nvim ~/.config/nvim
create_symlink ~/.dotfiles/config/tmux ~/.config/tmux

#pip3 install --user git+git://github.com/powerline/powerline

create_symlink ~/.dotfiles/vimrc ~/.vimrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#rm -rf ~/.vim/bundle/*
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PlugInstall! +qall!

create_symlink ~/.dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh ~/.tmux/plugins/tpm/bin/install_plugins

create_symlink ~/dotfiles/texmf ~/$(TEXMF_LOCATION)texmf

if [ -d ~/.oh-my-zsh ]
then
    create_if_not_exists ~/.oh-my-zsh/custom/
    create_symlink ~/.dotfiles/zshrc ~/.zshrc
    create_symlink ~/.dotfiles/zsh_custom/themes ~/.oh-my-zsh/custom/themes
else
    echo "Oh-my-zsh not found, skip setup"
fi

exit 0
