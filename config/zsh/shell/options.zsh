# Changing Directories
setopt autocd            # enter dir without `cd`
setopt auto_pushd        # push cd target into dir stack automatically
setopt pushd_ignore_dups # no duplicates in the dir stack

# Completion
setopt automenu         # two tabs triggers completion menu
setopt auto_param_slash # add / instead of whitespace when matching dirs

# Expansion & Globbing
setopt equals        # enables = filename expansion
setopt extended_glob # matches ~, ^, and #

# History
setopt append_history       # keep writting into the same file
setopt hist_ignore_all_dups # drops the oldest command copy when a duplicate is run
setopt hist_save_no_dups    # older duplicate commands are omitted
setopt inc_append_history   # write to histfile right after command is executed
setopt share_history        # same histfile for all terminals
