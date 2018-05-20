####################
# Base16
#   http://chriskempson.github.io/base16
####################
BASE16_SHELL=$HOME/.base16/shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_solarized-light

####################
# PATH
####################
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

####################
# Antigen
####################
source ~/.antigen/antigen.zsh

# Oh My Zsh
antigen use oh-my-zsh
antigen theme dracula/zsh dracula

# Bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle ssh-agent
antigen bundle asdf

# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Apply changes
antigen apply

####################
# Variables
####################
export VISUAL=vim
export EDITOR=vim

####################
# Alias
####################
source ~/.alias
