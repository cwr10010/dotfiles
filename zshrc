# where is oh_my_zsh is installed

PATH="$PATH:/usr/local/bin"
PATH="$PATH:~/Library/Python/3.8/bin"

alias ls='ls --color=auto'
alias dircolors='gdircolors'
TERM=screen-256color

export EDITOR=nvim
export LESSEDIT="$EDITOR ?lm+%lm. %f"

alias vim=nvim
alias vi=vim
alias v=vim
alias vf=vifm

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export ZSH=~/.oh-my-zsh

ZSH_THEME="spaceship"
BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_DEFAULT_USER="carsten"
BULLETTRAIN_IS_SSH_CLIENT=$SSH_CLIENT
#oh my zsh plugins
plugins=(common-aliases git brew colorize git-extras gnu-utils history osx tmux ssh-agent sudo urltools xcode zsh-navigation-tools jsontools)
#start tmux (if not running) when firing up a shell
ZSH_TMUX_AUTOSTART=true
# make ruby use homebrews openssl

if [[ -a ~`id -u -nr`/.zshrc.local ]]; then
	source ~`id -u -nr`/.zshrc.local
fi

source $ZSH/oh-my-zsh.sh

test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
