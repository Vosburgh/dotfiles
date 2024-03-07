{ inputs, config, lib, pkgs, ... }:

{
  # Add options for hyprland, a wayland window manager
  options.kdePlasma6.enable = lib.mkEnableOption "kdePlasma6";

  # Enable hyprland if desired
  config = lib.mkIf config.kdePlasma6.enable {

    services.xserver.desktopManager.plasma6.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      oxygen
    ];

  };
} 