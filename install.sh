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

git clone https://github.com/cwr10010/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh ~/.tmux/plugins/tpm/scripts/install_plugins.sh
if [ ! -d ~/.config ]
then
  mkdir ~/.config
fi
ln -s ~/.dotfiles/config/powerline ~/.config/powerline
pip install --user git+git://github.com/powerline/powerline

if [ -e `which zsh` ]
then
  if [ ! -d ~/.oh-my-zsh/custom/ ]
  then
        mkdir ~/.oh-my-zsh/custom/
  fi
  ln -s ~/.dotfiles/zshrc ~/.zshrc
  ln -s ~/.dotfiles/zsh_custom/themes ~/.oh-my-zsh/custom/themes
fi

exit 0
