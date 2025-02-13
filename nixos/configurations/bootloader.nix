{ config, ... }:
{
  # Configure bootloader
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        # efiInstallAsRemovable = true;
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
      # grub2-theme = {
      #   enable = true;
      #   theme = "vimix";
      #   icon = "color";
      #   screen = "ultrawide2k";
      # };

    };
  };
}
