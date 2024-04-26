{ inputs, config, lib, pkgs, ... }:

{
  # Add options for hyprland, a wayland window manager
  options.kdePlasma6.enable = lib.mkEnableOption "kdePlasma6";

  # Enable hyprland if desired
  config = lib.mkIf config.kdePlasma6.enable {

    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    
    programs.kdeconnect.enable = true;

    # # KDE Connect stuff
    # environment.systemPackages = with pkgs; [
    #   kdePackages.kdeconnect-kde
    # ];
    networking.firewall = { 
      enable = true; 
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ]; # KDE Connect 
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ]; # KDE Connect
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      oxygen
    ];

  };
} 