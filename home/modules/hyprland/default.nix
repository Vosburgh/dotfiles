{ inputs, catppuccin, outputs, config, lib, pkgs, ... }:

{
  imports = [
      outputs.homeModules.hyprlock
      outputs.homeModules.waybar
  ];
  # Add options for hyprland, a wayland window manager
  options.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.hyprland.enable {

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
      };
      extraConfig = builtins.readFile ./hyprland.conf;
    };

    hyprlock.enable = true;
    waybar.enable = true;

    # Extra wayland-specific home configuration
    home = {
      # Extra packages accompanying hyprland
      packages = with pkgs; [
        # Install grimshot for screenshotting with hyprland
        grim
        grimblast
        
        playerctl # Allows mpd to work with playerctl
        pamixer
        
        xwayland  # Enable explicit use of xwayland compatibility layer
        
        hyprpicker  # Colour picker background blur
        hyprcursor

        swww
      ];
    };

    # Waybar dependecies
    services.mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Music";
      dataDir = "${config.home.homeDirectory}/.config/mpd";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
      network.startWhenNeeded = true;
    };
    
    # Allows mpd to work with playerctl.
    services.mpdris2.enable = true;
    services.playerctld.enable = true;
    services = {
      gammastep = {
        enable = true;
        provider = "manual";
        tray = true;
        latitude = 49.312916; 
        longitude = -123.081454;
      };
    };


  };
}