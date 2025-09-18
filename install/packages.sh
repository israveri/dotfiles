#!/bin/bash

#
# This file installs all the packages used or required that are available in Arch's official repositories
#

pkgs=(
    base
    base-devel
    bash-language-server
    bat
    bluez
    bluez-utils
    brightnessctl
    btop
    dbus
    eza
    fd
    fzf
    git
    greetd
    greetd-tuigreet
    gtk4
    gtk4-layer-shell
    inter-font
    jq
    lua-language-server
    luarocks
    mise
    neovim
    nerd-fonts
    noto-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    openssl
    pipewire
    pipewire-alsa
    pipewire-jack
    pipewire-pulse
    polkit
    ripgrep
    sqlite
    starship
    swww
    tree
    tree-sitter
    ttf-dejavu
    ttf-liberation
    uwsm
    waybar
    wireplumber
    xdg-desktop-portal-hyprland
    zsh
    zsh-completions
)

sudo pacman -S --noconfirm --needed "${pkgs[@]}"

