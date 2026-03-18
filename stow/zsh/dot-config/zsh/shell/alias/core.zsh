alias reload="exec zsh"

# Package Management
alias cleanup="paru -Rsn $(paru -Qtdq)"
alias rmpkg="paru -Rsn"
alias update="paru -Syu"

# System Control
alias jctl="journalctl"
alias jctlerr="journalctl -p 3 -xb"
alias sctl="systemctl"
