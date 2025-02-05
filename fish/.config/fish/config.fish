if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

atuin init fish | source

zoxide init fish | source
alias cd="z"

starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# uv
fish_add_path "/home/greg/.local/bin"
