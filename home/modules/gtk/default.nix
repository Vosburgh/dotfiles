{ config, lib, pkgs, ... }:

{
  # Add options for Gtk, toolkit for gnome
  options.gtk.config.enable = lib.mkEnableOption "gtk.config";

  # Configure Gtk if desired
  config = lib.mkIf config.gtk.config.enable {
 
  # home.packages = with pkgs; [
  #   (catppuccin-kvantum.override {
  #     accent = "Blue";
  #     variant = "Macchiato";
  #   })
  # ];

  # xdg.configFile = {
  #   "Kvantum/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Macchiato-Blue/Cattpuccin-Macchiato-Blue.kvconfig";
  #   "Kvantum/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Macchiato-Blue/Cattpuccin-Macchiato-Blue.svg";
  # };

  # qt = {
  #     enable = true;
  #     platformTheme = "gtk";
  #     style = {
  #       name = "adwaita-dark";
  #       package = pkgs.adwaita-qt;
  #     };
  #   };


  gtk = {
    enable = true;
    font = {
      name = "Fira Code 9";
    };
    cursorTheme = {
      name = "phinger-cursors";
      package = pkgs.phinger-cursors;
    };
    iconTheme = {
      name = "Pop";
      package = pkgs.pop-icon-theme;
    };
    # theme = {
    #   name = "Pop";
    #   package = pkgs.pop-gtk-theme;
    # };
    theme = {
      package = pkgs.catppuccin-gtk.override {
          accents = ["sapphire"];
          size = "compact";
          tweaks = ["rimless"];
          variant = "macchiato";
        };
      name = "Catppuccin-Macchiato-Compact-Sapphire-Dark";
    };
    # theme = {
    #   name = "Tokyonight-Dark-BL";
    #   package = pkgs.tokyo-night-gtk;
    # };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    # Set environment variables
    };
    home.sessionVariables = {
      GDK_BACKEND = "wayland";
      };
  };
}