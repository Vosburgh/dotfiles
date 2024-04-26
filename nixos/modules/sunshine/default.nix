{ config, lib, pkgs, ... }:

{
  # Add options for sunshine
  options.sunshine.enable = lib.mkEnableOption "sunshine";

  # Configure sunshine if desired
  config = lib.mkIf config.sunshine.enable {

    environment.systemPackages = with pkgs; [
      sunshine
    ];

    networking.firewall.allowedTCPPorts = [ 47984 47989 47990 48010 ];
    networking.firewall.allowedUDPPortRanges = [
        { from = 47998; to = 48000; }
        { from = 8000; to = 8010; }
      ];

    systemd.user.services.sunshine = {
      description = "Sunshine self-hosted game stream host for Moonlight";
      startLimitBurst = 5;
      startLimitIntervalSec = 500;
      serviceConfig = {
        ExecStart = "${config.security.wrapperDir}/sunshine";
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };

  };
}