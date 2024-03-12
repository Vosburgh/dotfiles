{ config, pkgs, outputs, ... }:
{

    imports = [
      # ./../modules/hyprland/default.nix
      # ./../modules/gtk/default.nix
      # ./../modules/swaylock/default.nix
      outputs.homeModules.gtk
      outputs.homeModules.hyprland
      outputs.homeModules.swaylock
    ];

  # Custom Modules

  gtk.config.enable = true;
  hyprland.enable = true;
  swaylock.enable = true;

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
      vscodium
      waybar

      # Utilities
      glxinfo
      neofetch
      polkit_gnome
      wget
      tree
      
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