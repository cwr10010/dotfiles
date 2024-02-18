#function fish_user_key_bindings
#  bind \cr 'peco_select_history (commandline -b)'
#end
function wrap_fzf_history
    history merge
    fzf_history
end

function wrap_fzf_file
    fzf_file --preview "bat --style=numbers --color=always --line-range :500 {}"
end

function fish_user_key_bindings
    bind \cr wrap_fzf_history
    bind \co wrap_fzf_file
end
