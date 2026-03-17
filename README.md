# Dotfiles

Collection of config files, scripts and other stuff that I use on my devices.

## Requirements

Only requirement other than a bare system is `curl` to run remotely or `git` if you want to clone the repo first. Everything else will be installed and configured by the script.

## Usage

To install run

`curl -L https://raw.githubusercontent.com/israveri/dotfiles/refs/heads/main/install | sh`

Or clone the repository locally and run the install script manually

`./install`

## Warnings

- Don't run this script. This repo is mainly meant for remote archival only. It was made to be run on my machines and it makes a series of assumptiions about the system that will almost certainly not match what you use. Rumage through and steal whatever you like, tough.

- The files below are mainly colorscheme files and were set to not have changes tracked to avoid messing git stage or comits with unwanted changes everytime I switched themes, color modes, and colorschemes.

            stow/gtk-3.0/dot-config/gtk-3.0/noctalia.css
            stow/gtk-4.0/dot-config/gtk-4.0/noctalia.css
            stow/hypr/dot-config/hypr/hyprtoolkit.conf
            stow/hypr/dot-config/hypr/noctalia/noctalia-colors.conf
            stow/kitty/dot-config/kitty/current-theme.conf
            stow/kitty/dot-config/kitty/themes/noctalia.conf
            stow/noctalia/dot-config/noctalia/colors.json
            stow/nvim/dot-config/nvim/lua/colors/noctalia.lua

    To track changes again if ever needed, run:

    `git update-index --no-assume-unchanged FILE_NAME`

