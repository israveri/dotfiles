# Behavior
zstyle ":completion:*" menu select
zstyle ":completion:*" completer _extensions _complete _approximate
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path $XDG_CACHE_HOME/zsh/.zshcompcache
zstyle ":completion:*" squeeze-slashes true

# Formating
zstyle ":completion:*:*:*:*:descriptions" format "%B%F{green}-- %d --%f%b"
zstyle ":completion:*:messages" format "%B%F{purple}-- %d --%f%b"
zstyle ":completion:*:*:*:*:corrections" format "%B%F{yellow}-- %d (errors: %e)--%f%b"
zstyle ":completion:*:warnings" format "%B%F{red}-- no matches --%f%b"

# Grouping & Sorting
zstyle ":completion:*" group-name ""
zstyle ":completion:*:*:-command-:*:*" group-order alias builtins functions commands

# Colors!
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# Module Zsh-Completions
fpath=($XDG_CONFIG_HOME/zsh/submodules/completions/src $fpath)

# Module Zsh-Autosuggestions
source $XDG_CONFIG_HOME/zsh/submodules/autosuggestions/zsh-autosuggestions.zsh

# Module Zsh-Syntax_highlighting
source $XDG_CONFIG_HOME/zsh/submodules/highlighting/zsh-syntax-highlighting.zsh
