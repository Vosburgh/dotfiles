{ config, inputs, pkgs, outputs, ... }:
{
  imports = [
    ./../theme
    outputs.homeModules.gtk
    outputs.homeModules.dunst
    outputs.homeModules.hyprland
    outputs.homeModules.lazygit
    outputs.homeModules.starship
    outputs.homeModules.neovim
    outputs.homeModules.waybar
    outputs.homeModules.zsh
  ];

  # Custom Modules
  gtk.config.enable = true;
  hyprland.enable = true;
  dunst.enable = true;
  starship.enable = true;
  # neovim.enable = true;
  waybar.enable = true;
  zsh.enable = true;
  lazygit.enable = true;
  
  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "23.11";

    packages = with pkgs; [

      # Programs
      beeper
      bitwarden
      blender
      btop
      kdePackages.dolphin
      dunst
      element-desktop
      git
      godot_4
      grimblast
      htop
      killall
      kitty
      krita
      lutris 
      nvtopPackages.amd 
      nwg-look  
      obsidian  
      pavucontrol 
      r2modman  
      rofi-wayland
      spotify
      vesktop
      vscodium

      # Utilities
      bat
      delta
      eza
      fzf
      glxinfo
      ncdu
      neofetch
      p7zip
      polkit_gnome
      wget
      wev # wayland event viewer
      tree
      unzip

      # winetricks (all versions)
      winetricks

      # native wayland support (unstable)
      wineWowPackages.waylandFull
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
  xdg.enable = true;
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  
  programs = {
    git = {
      enable = true;
      userName = "Vosburgh";
      userEmail = "nickvosburghy@gmail.com";
    };

    # Cheat sheets
    navi.enable = true;

    home-manager.enable = true;
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };

  };
}