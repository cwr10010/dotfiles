# where is oh_my_zsh is installed
export ZSH=~/.oh-my-zsh
ZSH_THEME="bullet-train"
BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_DEFAULT_USER="carsten"
BULLETTRAIN_IS_SSH_CLIENT=$SSH_CLIENT
#oh my zsh plugins
plugins=(common-aliases git brew colorize git-extras gnu-utils history osx tmux ssh-agent sudo urltools xcode zsh-navigation-tools jsontools)
#start tmux (if not running) when firing up a shell
ZSH_TMUX_AUTOSTART=true
PATH=~/Library/Python/3.8/bin:$PATH
# make ruby use homebrews openssl
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"


if [[ -a ~`id -u -nr`/.zshrc.local ]]; then
	source ~`id -u -nr`/.zshrc.local
fi
export EDITOR=vim

alias v=vim
alias vf=vifm

source $ZSH/oh-my-zsh.sh
