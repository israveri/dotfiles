#!/bin/sh
for socket in $(ls ${XDG_RUNTIME_DIR:-/tmp}/nvim.*.0 2>/dev/null); do
    nvim --server "$socket" --remote-send ':StatuslineReload<CR>' 2>/dev/null
done
