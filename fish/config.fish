if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

zoxide init fish | source

# eza
alias ls="eza --icons"
alias ll="eza -lh --icons"
alias la="eza -la --icons"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# surrealdb
set --export PATH $HOME/.surrealdb $PATH

# iriun xwaland
alias iriun="QT_QPA_PLATFORM=xcb iriunwebcam"

