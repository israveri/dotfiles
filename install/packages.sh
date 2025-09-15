#!/bin/bash

#
# This file installs all the packages used or required that are available in Arch's official repositories
#

pkgs=(
	base
	base-devel
	starship
	git
	noto-fonts
	zsh
	zsh-completions
	polkit
	mise
	eza
	fzf
	btop
	neovim
	jq
	pipewire
	pipewire-jack
	pipewire-pulse
	pipewire-alsa
	wireplumber
	greetd
	greetd-tuigreet
	swww
	uwsm
	gtk4
	gtk4-layer-shell
	dbus
	openssl
	sqlite
	waybar
	bluez
	bluez-utils
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	ttf-liberation
	ttf-dejavu
	nerd-fonts
	inter-font
	brightnessctl
	luarocks
	fd
	ripgrep
	bat
)

sudo pacman -S --noconfirm --needed "${pkgs[@]}"
