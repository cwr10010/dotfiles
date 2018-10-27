# where is oh_my_zsh is installed
export ZSH=~/.oh-my-zsh
ZSH_THEME="bullet-train"
BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_DEFAULT_USER="carsten"
BULLETTRAIN_IS_SSH_CLIENT=$SSH_CLIENT
#oh my zsh plugins
plugins=(common-aliases git battery brew colorize common-aliases git-extras gnu-utils history mvn node npm osx tmux spring ssh-agent sudo terminalapp urltools xcode zsh-navigation-tools python pip pep8 jsontools)
#start tmux (if not running) when firing up a shell
ZSH_TMUX_AUTOSTART=true
PATH=$PATH:~/Library/Python/3.7/bin

if [[ -a ~`id -u -nr`/.zshrc.local ]]; then
	source ~`id -u -nr`/.zshrc.local
fi
export EDITOR=vim

source $ZSH/oh-my-zsh.sh
