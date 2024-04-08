{ config, pkgs, outputs, ... }:
{
    imports = [
      ./../variables/theme
      # ./../modules/hyprland/default.nix
      # ./../modules/gtk/default.nix
      # ./../modules/swaylock/default.nix
      outputs.homeModules.gtk
      outputs.homeModules.dunst
      outputs.homeModules.hyprland
      outputs.homeModules.swaylock
      outputs.homeModules.syncthing
      outputs.homeModules.starship
    ];

  # Custom Modules

  gtk.config.enable = true;
  hyprland.enable = true;
  swaylock.enable = true;
  syncthing.enable = true;
  dunst.enable = true;

  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "23.11";

    packages = with pkgs; [

      # Programs
      alacritty
      bitwarden
      blender
      btop
      discord
      libsForQt5.dolphin
      dunst
      element-desktop
      filelight
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
      starship
      swaybg
      swww
      tmux
      vesktop
      vscodium
      waybar

      # Utilities
      glxinfo
      neofetch
      p7zip
      polkit_gnome
      wget
      tree
      unzip

      # Gaming shit
      
      # support 64-bit only
      # wine64
      
      # winetricks (all versions)
      winetricks

      # native wayland support (unstable)
      wineWowPackages.waylandFull


    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    git = {
      enable = true;
      userName = "Vosburgh";
      userEmail = "nickvosburghy@gmail.com";
    };


    starship = {
      enable = true;
      # custom settings
      # settings = {
      #   add_newline = false;
      #   aws.disabled = true;
      #   gcloud.disabled = true;
      #   line_break.disabled = true;
      # };
    };

    tmux = {
      enable = true;
      mouse = true;
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
    gammastep = {
      enable = true;
      provider = "manual";
      tray = true;
      latitude = 49.312916; 
      longitude = -123.081454;
    };


  };
}