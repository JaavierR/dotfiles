if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

alias vim="nvim"
alias lla="ll -a"
alias cat="bat"

# Git
alias gs="git status -sb"
alias gaa="git add -A"
alias gco="git checkout"
alias gp="git push"
alias gl="git pull"

# Laravel
alias sail="[ -f sail ] && sh sail || sh vendor/bin/sail"

# pnpm
set -gx PNPM_HOME "/home/javier/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
