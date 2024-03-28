{ inputs, config, lib, pkgs, ... }:

{
    # Add options for hyprlock, a wayland window manager
  options.hyprlock.enable = lib.mkEnableOption "hyprlock";

  # Enable hyprlock if desired
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;

      general = {
        disable_loading_bar = false;
        hide_cursor = false;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "~/Pictures/Backgrounds/SpiralGalaxyNGC3351.png";
          blur_size = "4";
          blur_passes = "3";
          noise = "0.0117";
        }
      ];

      # Fill in the rest 

      # Inputs field
      # things to display
    };
  };
}