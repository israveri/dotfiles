# Convert bin/cue files to chd
cdtochd() {
    # Check if a parameter was provided
    if [ -z "$1" ]; then
        echo "Usage: cuetochd filename.cue"
        return 1
    fi

    # Check if the file exists
    if [ ! -f "$1" ]; then
        echo "File '$1' not found."
        return 1
    fi

    # Extract the filename without the extension
    local base_name="${1%.*}"


    chdman createcd -i "$1" -o "$base_name.chd"
}

# Convert iso files to chd
dvdtochd() {
    # Check if a parameter was provided
    if [ -z "$1" ]; then
        echo "Usage: cuetochd filename.iso"
        return 1
    fi

    # Check if the file exists
    if [ ! -f "$1" ]; then
        echo "File '$1' not found."
        return 1
    fi

    # Extract the filename without the extension
    local base_name="${1%.*}"


    chdman createdvd -i "$1" -o "$base_name.chd"
}

# Generates m3u files for multi disc games
makem3u() {
    # Check if a directory was provided
    if [ -z "$1" ]; then
        echo "Usage: makem3u <directory_path>"
        return 1
    fi

    # Check if the path is actually a directory
    if [ ! -d "$1" ]; then
        echo "'$1' is not a valid directory."
        return 1
    fi

    # Check if the directory is empty (ignoring hidden files)
    # We use 'find' to see if there's at least one non-hidden file
    if [ -z "$(find "$1" -maxdepth 1 -type f ! -name ".*" -print -quit)" ]; then
        echo "Directory '$1' is empty. No .m3u generated."
        return 1
    fi

    # Define the output filename based on the directory name
    # Strip trailing slash if present, then get the base name
    local dir_name=$(basename "${1%/}")
    local output_file="${dir_name}.m3u"

    # Generate the file
    # We find all files, sort them (Disc 1, 2, etc),
    # and prefix them with the directory path.
    find "$1" -maxdepth 1 -type f ! -name ".*" | sort > "$output_file"

    echo "Successfully created '$output_file' with $(wc -l < "$output_file") entries."
}
