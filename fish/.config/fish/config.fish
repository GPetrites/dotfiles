if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

zoxide init fish | source
alias cd="z"

starship init fish | source
