# Bat
# https://github.com/sharkdp/bat
alias cat="bat"

# Nevovim
# https://github.com/neovim/neovim
alias vim="nvim"

# Git
alias g="git"
alias glog="g log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"

# Ls replacement
alias l="eza -l --icons --git -a -s type"
alias lt="eza --tree --level=2 --long --icons --git -s type --ignore-glob=\".git|node_modules|.cache|.idea|.vscode|vendor|public|storage|bootstrap|dist|build|node_modules|.next|.nuxt|.venv|.gitignore|.gitmodules|.gitattributes|.gitkeep\""

# Git alias
abbr -a gst g status -sb
abbr -a ga  g add
abbr -a gaa g add -A
abbr -a gc  g commit
abbr -a gcm g commit -m
abbr -a gca g commit --amend
abbr -a gs  g switch
abbr -a gsc g switch -c
abbr -a grt g restore
abbr -a gb  g branch
abbr -a gbd g branch -D
abbr -a gcl g clone
abbr -a gp  g push
abbr -a gpf g push --force-with-lease
abbr -a gpl g pull
abbr -a gl  g l
abbr -a gd  g diff
abbr -a gds g diff --staged
abbr -a gr  g rebase -i HEAD~15
abbr -a gf  g fetch
abbr -a gfc g findcommit
abbr -a gfm g findmessage
abbr -a gco g checkout

# Laravel
alias sail="[ -f sail ] && sh sail || sh vendor/bin/sail"
alias ar="php artisan"

# Docker
alias d="docker"
alias dc="docker compose"

# misc
alias reload="exec fish"

