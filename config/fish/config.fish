# config.fish is executed last
# init tmux here
set -x TERM screen-256color

if status is-interactive
and not set -q TMUX
    exec tmux attach

end
