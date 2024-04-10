{ config, ... }:
{
  # Configure bootloader
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
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