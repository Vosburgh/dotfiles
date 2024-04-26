{ config, inputs, pkgs, outputs, ... }:
{
  imports = [
    ./../options/theme
    outputs.homeModules.gtk
    outputs.homeModules.dunst
    outputs.homeModules.hyprland
    # outputs.homeModules.hyprlock
    outputs.homeModules.swaylock
    outputs.homeModules.starship
    outputs.homeModules.neovim
    outputs.homeModules.waybar
    outputs.homeModules.zsh
    # inputs.nix-colors.homeModules.default
  ];

  # Custom Modules

  gtk.config.enable = true;
  hyprland.enable = true;
  # hyprlock.enable = true;
  # swaylock.enable = true;
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
      alacritty
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
      
      lutris 
      mangohud 
      neovim  
      nvtopPackages.amd 
      nwg-look  
      obsidian  
      pavucontrol 
      r2modman  
      rofi-wayland
      spotify
      spotify-player
      spotifyd
      starship
      swww
      vesktop
      vscodium
      waybar

      

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

      # Gaming
      # Emulators
      rpcs3   # ps3
      xemu    # xbox 360

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

    # Enable lazy git client
    lazygit.enable = true;

    # Fuzzy file finding
    fzf.enable = true;

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