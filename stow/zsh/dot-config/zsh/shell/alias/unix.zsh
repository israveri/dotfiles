alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="eza --icons --header --long --git --classify --group-directories-first --color=always"
alias lsa="ls --all"
alias lt="ls --tree -L1 --no-permissions --no-filesize --no-user --no-time --no-git"
alias lta="lt --all"

alias cat="bat"

alias grep="rg -uu --smart-case --color=always"
alias rgrep="rg --smart-case --color=always"
alias pgrep="rg --hidden --smart-case --color=always"
