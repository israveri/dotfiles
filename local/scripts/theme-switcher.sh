#!/usr/bin/bash

#############
# Variables
#############
SELECTED_THEME=""

###################
# SETUP FUNCTIONS
###################
#
# This function list colorschemes and pipes the
#  directory list to rofi so the user can choose
#  a theme. The chosen theme is stored in a global
#  variable to be referenced in other functions
select_theme() {
    echo "> Selecting Theme"

    local choice=$(ls ~/.config/colorschemes | rofi -dmenu)

    if [[ -n $choice ]]; then
	SELECTED_THEME=$choice
	echo "  + $SELECTED_THEME selected"
	echo ""
    else
	echo "  - No theme was selected"
	echo ""
    fi
}

# In case the global variable with the chosen theme
#  is valued, we apply the theme to each application
apply() {
    if [[ -n $SELECTED_THEME ]]; then
	echo "> Applying theme to applications"

	set_ghostty_theme
	set_rofi_theme
    fi
}

######################
# APPLYING FUNCTIONS
######################
set_ghostty_theme() {
    local dir=~/.config/ghostty/themes

    mkdir -p $dir

    cp ~/.config/colorschemes/${SELECTED_THEME}/ghostty/${SELECTED_THEME}.conf "${dir}/colors.conf"

    echo "  + Ghostty applied with ${SELECTED_THEME}"
}

set_rofi_theme() {
    local dir=~/.config/rofi

    mkdir -p $dir

    cp ~/.config/colorschemes/${SELECTED_THEME}/rofi/${SELECTED_THEME}.rasi "${dir}/colors.rasi"

    # After placing the theme file in the right place, we must edit the config
    #  file to ensure it references the theme file
    #
    # `tac` prints the file in reverse order for performance
    # `grep` filter out empty lines and return the first non-empty
    # `sed` matches the @theme line in the config file and removes it
    # `echo` add a pristine line in its place
    local last_line=$(tac "${dir}/config.rasi" | grep -m 1 ".")
    sed -i "/^@theme .*$/d" "${dir}/config.rasi"
    echo "@theme \"${dir}/colors.rasi\"" >> ${dir}/config.rasi

    echo "  + Rofi applied with ${SELECTED_THEME}"
}


select_theme && apply
