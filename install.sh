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
        brew tap homebrew/cask-fonts
        brew install font-meslo-for-powerline
        brew install python3 ruby graphviz harfbuzz coreutils libevent tmux \
        git reattach-to-user-namespace maven tree ssh-copy-id wakeonlan \
        wget xz sqlite urlview uptime psutils alacritty nvim fish peco \
        fzf the_silver_searcher git-delta bat

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
create_symlink ~/.dotfiles/config/alacritty ~/.config/alacritty
create_symlink ~/.dotfiles/config/nvim ~/.config/nvim
create_symlink ~/.dotfiles/config/tmux ~/.config/tmux
create_symlink ~/.dotfiles/config/fish ~/.config/fish
create_symlink ~/.dotfiles/config/peco ~/.config/peco


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall! +qall!

create_symlink ~/.dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh ~/.tmux/plugins/tpm/bin/install_plugins

create_symlink ~/dotfiles/texmf ~/$(TEXMF_LOCATION)texmf


curl -L https://get.oh-my.fish > /tmp/install
fish /tmp/install --path=~/.local/share/omf --config=~/.config/omf
rm /tmp/install

if [ -d ~/.config/omf ]
then
  omf install spacefish
  omf install peco
  omf install brew
  omf install rvm
fi

exit 0
