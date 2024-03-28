{ inputs, config, lib, pkgs, ... }:

{
  # Add options for hyprland, a wayland window manager
  options.hyprland.enable = lib.mkEnableOption "hyprland";

  # Enable hyprland if desired
  config = lib.mkIf config.hyprland.enable {
    # Enable and configure hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
      };
      extraConfig = builtins.readFile ./hyprland.conf;
    };

    # Allow swaylock to lock computer
    swaylock.enable = true;

    # Extra wayland-specific home configuration
    home = {

      # Extra packages accompanying hyprland
      packages = with pkgs; [

        # Install grimshot for screenshotting with hyprland
        grim
        grimblast

        # Enable explicit use of xwayland compatibility layer
        xwayland

        # Colour picker
        hyprpicker
      ];

      # Specify desktop environment environment variables
      sessionVariables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
      };
    };
  };
}