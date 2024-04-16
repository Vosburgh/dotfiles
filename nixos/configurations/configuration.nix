{ inputs, config, lib, pkgs, outputs, ... }:

{

  # Imports
  imports = [
    outputs.nixosModules.hyprland
    outputs.nixosModules.kdeplasma6
    outputs.nixosModules.steam
    outputs.nixosModules.syncthing
    ./bootloader.nix
    ./hardware-configuration.nix
  ];

  # Custom Modules
  hyprland.enable = true;
  kdePlasma6.enable = true;
  steam.enable = true;
  syncthing.enable = true;

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
      #  autoLogin = {
      #    enable = true;
      #    user = "nick";
      #  };
    };
  
  services.displayManager = {
      sddm = {
        enable = true;
      };
      defaultSession = "hyprland";
  };

  nix.settings = {
    # Enable flakes and 'nix' command
    experimental-features = "nix-command flakes";

    # Deduplicate and optimize nix store
    auto-optimise-store = true;
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

  # Mount NAS
  # Does'nt work 
  # fileSystems."/mnt/nasburgh" = {
  #     device = "//192.168.50.137/volume1/data";
  #     fsType = "cifs";
  #     # options = [ 
  #     #   "rw" 
  #     #   "credentials=/etc/nixos/smb-secrets"
  #     #   ];
  #   options = [
  #     "x-systemd.automount" 
  #     "noauto" 
  #     "x-systemd.idle-timeout=60"
  #     "x-systemd.device-timeout=5s" 
  #     "x-systemd.mount-timeout=5s"
  #     "credentials=/etc/nixos/smb-secrets"
  #     "uid=1000"
  #     "gid=100"
  #   ];
  #   };

  # Mount NAS
  fileSystems."/mnt/nasburgh/data" = {
    device = "192.168.50.137:/volume1/data";
    fsType = "nfs";
    options = [
      "x-systemd.automount" 
      "noauto" 
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s" 
      "x-systemd.mount-timeout=5s"
      # "credentials=/etc/nixos/smb-secrets"
      # "uid=1000"
      # "gid=100"
    ];
  };

    fileSystems."/mnt/nasburgh/personal" = {
    device = "192.168.50.137:/volume1/Personal";
    fsType = "nfs";
    options = [
      "x-systemd.automount" 
      "noauto" 
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s" 
      "x-systemd.mount-timeout=5s"
      # "credentials=/etc/nixos/smb-secrets"
      # "uid=1000"
      # "gid=100"
    ];
  };


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
    shell = pkgs.zsh;
  };
  
  # Garbage collection
  nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 7d"; # Retain last 3 generations 
};

  
  # Configure environment
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      cifs-utils
      keyutils
      git
      git-lfs
      kitty
      pavucontrol
      wireguard-tools
      xwaylandvideobridge
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

    zsh.enable = true;

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
    xfconf.enable = true;

    # home-manager.enable = true;
  };
  
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

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
