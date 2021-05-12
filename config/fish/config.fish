# config.fish is executed last
# init tmux here
set -x LANG de_DE.UTF-8
set -x LC_CTYPE de_DE.UTF-8
set -x TERM screen-256color

if status is-interactive
and not set -q TMUX
    exec tmux -u attach

end
