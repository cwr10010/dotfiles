#!/usr/bin/env bash

SYSTEM=`uname -s`

case "$SYSTEM" in

    Darwin) echo "Found Darwin environment"
            if [ ! -e `which brew` ]
                then
                        echo "Brew not found"
                        exit -1
                fi
                brew install macvim --with-override-system-vim --with-lua --with-luajit --with-luajit --with-cscope
                brew install python libevent tmux git reattach-to-user-namespace maven \
                   tree grep ssh-copy-id wakeonlan wget xz sqlite urlview uptime psutils cmake
                ;;
    *) echo "Unknown System"
                ;;

esac
DATE=`date +"%s"`

create_symlink() {
    mv $1 $1.$DATE
    ln -s $2 $1
}

if [ ! -d ~/.dotfiles ]
then
  git clone https://github.com/cwr10010/dotfiles.git ~/.dotfiles
else
  git pull ~/.dotfiles
fi

create_symlink ~/.dotfiles/vimrc ~/.vimrc
rm -rf ~/.vim/bundle/*
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

create_symlink ~/.dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh ~/.tmux/plugins/tpm/scripts/install_plugins.sh
if [ ! -d ~/.config ]
then
  mkdir ~/.config
fi
create_symlink ~/.dotfiles/config/powerline ~/.config/powerline
pip install --upgrade --user git+git://github.com/powerline/powerline

if ([ -e `which zsh`] && [ -d ~/.oh-my-zsh ])
then
  if [ ! -d ~/.oh-my-zsh/custom/ ]
  then
        mkdir ~/.oh-my-zsh/custom/
  fi
  create_symlink ~/.dotfiles/zshrc ~/.zshrc
  create_symlink ~/.dotfiles/zsh_custom/themes ~/.oh-my-zsh/custom/themes
else
  echo "Oh-my-zsh not found, skip setup"
fi

exit 0
