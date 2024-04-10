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

  };
}