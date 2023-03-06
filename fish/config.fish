if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

alias vim="nvim"
alias lla="ll -a"
alias cat="bat"

# Git
alias gs="git status -sb"
