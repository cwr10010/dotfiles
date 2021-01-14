if status is-interactive
and not set -q TMUX
    exec tmux

    alias v=nvim
    alias vi=nvim
    alias vim=nvim

    export EDITOR=nvim
end
