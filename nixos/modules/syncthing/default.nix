{ config, lib, pkgs, ... }:

{
  # Add options for syncthing, lock screen for wayland
  options.syncthing.enable = lib.mkEnableOption "syncthing";

  # Configure syncthing if desired
  config = lib.mkIf config.syncthing.enable {

    # Configure syncthing
    services = {
        syncthing = {
            enable = true;
            user = "nick";
            dataDir = "/home/nick/Documents";    # Default folder for new synced folders
            configDir = "/home/nick/.config/syncthing";   # Folder for Syncthing's settings and keys
        };
    };
    
    # Syncthing ports: 8384 for remote access to GUI
    # 22000 TCP and/or UDP for sync traffic
    # 21027/UDP for discovery
    # source: https://docs.syncthing.net/users/firewall.html
    # NECESSARY otherwise connection type will be Relay WAN which is shit 
    networking.firewall.allowedTCPPorts = [ 8384 22000 ];
    networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  };
}