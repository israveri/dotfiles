# Disables vimcmd
bindkey -e

############
# Movement
############
bindkey '^[[1;5D' backward-word                # Left arrow
bindkey '^[[1;5C' forward-word                 # Right arrow
bindkey '^[[3~' delete-char                    # Delete key
bindkey '^[[1~' beginning-of-line              # Home key
bindkey '^[[4~' end-of-line                    # End key
bindkey '^[[5~' beginning-of-line-hist-search  # Pg Up
bindkey '^[[6~' end-of-line-hist-search        # Pg Dn


# Widgets for binding
function run_zoxide_interactive {
    BUFFER="zi"
    zle .accept-line
}
zle -N run_zoxide_interactive

bindkey '^p' run_zoxide_interactive
