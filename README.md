# Dotfiles

Collection of config files, scripts and other stuff that I use on my devices.

## Warning

Don't run `./install` as it has absolutelly no protections and it assumes it's running in on of my devices. It willl probably mess up your machine.

## Usage

1. Install packages (skip this step if you don't know exactly what you are doing)

`$ ./src/packages.sh`

2. Initialize the git submodules

`$ git submodule init`

3. Update the submodules

`$ git submodule update`

4. Install all configuration

`$ stow .`

