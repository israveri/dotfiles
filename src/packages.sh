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
    fastfetch
    fd
    fzf
    git
    greetd
    greetd-tuigreet
    gtk4
    gtk4-layer-shell
    hyprpicker
    hyprshot
    inter-font
    jq
    libffi
    libyaml
    lua-language-server
    luarocks
    mise
    neovim
    nerd-fonts
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
    ruby-lsp
    rust
    sqlite
    starship
    stylua
    swww
    tree-sitter
    ttf-dejavu
    ttf-liberation
    uwsm
    waybar
    wireplumber
    wl-clipboard
    xdg-desktop-portal-hyprland
    zlib
    zsh
    zsh-completions
)

sudo pacman -S --noconfirm --needed "${pkgs[@]}"

