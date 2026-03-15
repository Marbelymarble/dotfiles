if status is-interactive
    alias vim="nvim"

    # Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source
fish_config theme choose catppuccin-macchiato --color-theme=dark

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
