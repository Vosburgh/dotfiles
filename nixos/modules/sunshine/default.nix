{ config, lib, pkgs, ... }:

{
  # Add options for sunshine
  options.sunshine.enable = lib.mkEnableOption "sunshine";

  # Configure sunshine if desired
  config = lib.mkIf config.sunshine.enable {

    # Configure sunshine
    services = {
        sunshine = {
            enable = true;
            user = "nick";
            dataDir = "/home/nick/Documents";    # Default folder for new synced folders
            configDir = "/home/nick/.config/sunshine";   # Folder for sunshine's settings and keys
        };
    };
    environment.systemPackages = with pkgs; [
      sunshine
    ];

    networking.firewall.allowedTCPPorts = [ 47984 47989 47990 48010 ];
    networking.firewall.allowedUDPPortRanges = [
        { from = 47998; to = 48000; }
        { from = 8000; to = 8010; }
      ];


  };
}