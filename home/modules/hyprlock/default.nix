{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];
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

      backgrounds = [
        {
          monitor = "";
          path = "~/Pictures/Backgrounds/SpiralGalaxyNGC3351.png";
          blur_size = 4;
          blur_passes = 3;
          noise = 0.0117;
        }
      ];

      # Fill in the rest 

      input-fields = [
          {
            monitor = "DP-3";

            size = {
              width = 300;
              height = 50;
            };

            outline_thickness = 2;

            outer_color = "rgb(${config.colorScheme.palette.base00})";
            inner_color = "rgb(${config.colorScheme.palette.base02})";
            font_color = "rgb(${config.colorScheme.palette.base06})";

            fade_on_empty = false;
            placeholder_text = ''<span font_family="Fira Code 9" foreground="##${config.colorScheme.palette.base09}">Password...</span>'';

            dots_spacing = 0.3;
            dots_center = true;
          }
        ];

      labels = [
        {
          monitor = "";
          text = "$TIME";
          font_family="Fira Code 9";
          font_size = 72;
          color = "rgb(${config.colorScheme.palette.base06})";

          position = {
            x = 0;
            y = 80;
          };

          valign = "center";
          halign = "center";
        }
      ];

    };
  };
}