# Commands 
## Prerequisite:
- AMD GPU Machine

## System setup:
1. Install nixos
2. Maybe install flakes first? I don't know if this will run on a fresh system without flakes enabled first.
3. `sudo nixos-rebuild switch --flakes ~/.config/nix#artorias`

## Home (user space) setup:
1. Install `home-manager` command via standalone steps listed at [here](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone) 
2. possibly reboot
3. logged into user, run `home-manager switch --flakes ~/.config/nix#nick@artorias` 
  a. It's possible the command might yell at you to use some backup flag in the command, just add the flag to the command and run again.
