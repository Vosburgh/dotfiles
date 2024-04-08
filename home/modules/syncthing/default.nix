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
        tray.enable = true;
      };
    };

  };
}