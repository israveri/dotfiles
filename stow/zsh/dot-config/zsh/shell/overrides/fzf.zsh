export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND=""
export FZF_CTRL_T_OPTS=""

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
    local command="$1"
    shift

    case "$command" in
        cd)             fzf --preview "eza --tree --color=always {} | head -200" "$@" ;;
        export|unset)   fzf --preview "eval 'echo \$'{}" "$@" ;;
        ssh)            fzf --preview "dig {}" "$@";;
        *)              fzf --preview "bat -n --color=always --line-range :500 {}" "$@";;
    esac
}

# Source tinty-fzf enhanced ANSI passthrough
source "$XDG_DATA_HOME/tinted-theming/tinty/repos/fzf/ansi/ansi.sh"
