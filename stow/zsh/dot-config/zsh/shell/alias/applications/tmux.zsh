alias t="tmux attach || tmux new -s Work"

# Tmux Dev Layout
# |--------------|-----|
# |              |     |
# |  editor      | ai  |
# |              |     |
# |              |     |
# |--------------|     |
# |              |     |
# |  terminal    |     |
# |--------------|-----|
tdl() {
    [[ -z "$TMUX" ]] && { echo "Tmux must be running to use tdl"; return 1 }

    local editor_pane ai_pane
    local current_dir="${PWD}"
    local ai="opencode"

    # Grabs the pane id
    editor_pane="${TMUX_PANE}"

    # Creates ai split pane with 25% screen and grab its id
    #ai_pane=$(tmux split-window -h -p 25 -t "$editor_pane" -c "$current_dir" -P -F "#{pane_id}")

    # Creates terminal pane with 25% screen
    tmux split-window -v -p 25 -t "$editor_pane" -c "$current_dir"

    # Opens editor
    tmux send-keys -t "$editor_pane" "$EDITOR ." C-m

    # Opens ai
    #tmux send-keys -t "$ai_pane" "$ai ." C-m

    # Focus the editor pane
    tmux select-pane -t "$editor_pane"
}
