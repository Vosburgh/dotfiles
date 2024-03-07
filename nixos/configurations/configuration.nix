{ inputs, config, lib, pkgs, ... }:

{

  # Imports
  imports = [
    ./../modules/hyprland.nix
    ./../modules/kdePlasma6.nix
    ./../modules/nixSettings.nix
    ./../modules/steam.nix
    ./../modules/mesa-git.nix
    ./bootloader.nix
    ./hardware-configuration.nix
  ];

  # Custom Modules
  nix.config.enable = true;
  hyprland.enable = true;
  kdePlasma6.enable = true;
  steam.enable = true;

  # Define your hostname.
  networking.hostName = "artorias"; 

  # Specify kernel to use
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;
    # Configure keymap in X11
    xkb.layout = "us";
    xkb.variant = "";
    displayManager = {
      sddm = {
        enable = true;
      };
      defaultSession = "hyprland";
      #  autoLogin = {
      #    enable = true;
      #    user = "nick";
      #  };
    };
  };
  

  #Polkit
  security.polkit.enable = true;
  systemd = { 
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
        };
      };
  };


  # Configure Hardware
  hardware = {
    bluetooth.enable = true;
  };

  # GPU Drivers.
  boot.initrd.kernelModules = [ "amdgpu" ];
  # hardware.opengl.extraPackages = with pkgs; [
  #   amdvlk
  # ];
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.deviceSection = ''
      Option "VariableRefresh" "true"
    '';
  

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # User Configure
  users.users.nick = {
    isNormalUser = true;
    description = "Nick Vosburgh";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Configure environment
  environment = {
    systemPackages = with pkgs; [
      git
      git-lfs
      kitty
      pavucontrol

    ];
  };

  # Configure fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-han-sans
      source-han-serif
      source-han-mono
      source-han-code-jp
      twitter-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      dina-font
      ubuntu_font_family
      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    # Enable default fonts
    enableDefaultPackages = true;

    # Configure default fonts
    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu" "Regular" ];
        sansSerif = [ "Ubuntu" "Regular" ];
        monospace = [ "FiraCode Nerd Font" "Regular" ];
      };
    };
  };

  # Allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # Configure system-wide programs
  programs = {
    # Enable firefox
    firefox.enable = true;
 
    # Needed for anything GTK
    dconf.enable = true;

  };

  # Configure system-wide services
  services = {
    # Enable bluetooth support and device management (via bluetooth manager)
    blueman.enable = true;

    # Enable flatpak for non-nix packages (or temporary broken packages)
    flatpak.enable = true;
    
    # Enable CUPS to print documents
    printing.enable = true;
  };
  # Enable portals
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

    # Allow swaylock to work correctly
  security.pam.services.swaylock = {};

    # Get location from geoclue
    # TODO: Doesn't work
  location.provider = "geoclue2";
  

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
