source ~/.config/fish/alias.fish

set fish_greeting ""

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

function cx
  cd $argv && l
end

function ghpr
  GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
end

# Remove if the starship new line is set to true
function postexec_test --on-event fish_postexec
   echo
end

# Autostart tmux
# if status is-interactive
# and not set -q TMUX
#   tmux new-session -A -s main
# end

fish_ssh_agent

# pnpm
set -gx PNPM_HOME "/home/javier/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Install Starship
starship init fish | source

# Install zoxide
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Install pyenv
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-virtualenv
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

