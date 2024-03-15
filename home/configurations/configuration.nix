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
    ];

  # Custom Modules

  gtk.config.enable = true;
  hyprland.enable = true;
  swaylock.enable = true;
  dunst.enable = true;

  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "23.11";

    packages = with pkgs; [

      # Programs
      bitwarden
      blender
      btop
      discord
      dolphin
      dunst
      git
      godot_4
      grimblast
      htop
      killall
      kitty
      lutris
      mangohud
      gnome.nautilus
      neovim
      nwg-look
      pavucontrol
      rofi
      starship
      swaybg
      swww
      tmux
      vscodium
      waybar

      # Utilities
      glxinfo
      neofetch
      polkit_gnome
      wget
      tree

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
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
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