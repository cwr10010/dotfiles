# My collection of dotfiles. (WIP)

based on parts of [https://github.com/nicknisi/dotfiles]

## Setup

All steps are based on (mac)OS (X) with [iTerm2](https://www.iterm2.com), [Oh-My-Zsh](http://ohmyz.sh) and [Homebrew](http://brew.sh) installed

### Shell environment

    $> git clone https://github.com/cwr10010/dotfiles.git ~/.dotfiles
    $> brew install macvim --with-override-system-vim --with-lua --with-luajit --with-luajit --with-cscope
    $> brew install python libevent tmux git reattach-to-user-namespace maven \
       tree grep ssh-copy-id wakeonlan wget xz sqlite urlview uptime psutils cmake
    $> ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    $> ln -s ~/.dotfiles/vimrc ~/.vimrc
    $> ln -s ~/.dotfiles/zshrc ~/.zshrc
    $> ln -s ~/.dotfiles/config/powerline ~/.config/powerline
    $> ln -s ~/.dotfiles/zsh_custom/themes ~/.oh-my-zsh/custom/themes
    $> pip install --user git+git://github.com/powerline/powerline
    $> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    $> vim +PluginInstall +qall
    $> git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    $> ~/.tmux/plugins/tpm/bin/install_plugins

### Applications and fonts
* Import settings from ~/.dotfiles/iterm2/Solarized Dark.itermcolors into iTerm2
* Install fonts in ~/.dotfiles/fonts
* Setup iTerm2 to use Powerline-Font (Currently *12 pt Meslo LG S Regular for Powerline*)

### Additional setup
Some local setup can be stored in zshrc.local, like:

    alias wake_server="wakeonlan <MAC_ADDRESS>"
    export HOMEBREW_GITHUB_API_TOKEN=<API-TOKEN>
    BULLETTRAIN_CONTEXT_DEFAULT_USER=<ssh default user>

## TODO / Bugs
* [FIXME] Tmux config seems to hide <prefix>+j for going buffer down in VIM
* Wrap setup into one single shell-script
