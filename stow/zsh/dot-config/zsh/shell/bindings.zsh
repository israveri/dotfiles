# Disables vimcmd
bindkey -e

############
# Movement
############
bindkey '^[[1;5D' backward-word  # Left arrow
bindkey '^[[1;5C' forward-word   # Right arrow
bindkey '^[[H' beginning-of-line # Home key
bindkey '^[[F' end-of-line       # End key
bindkey '^[[3~' delete-char      # Delete key

bindkey '^p' autosuggest-accept # Ctrl+P accepts suggestion
