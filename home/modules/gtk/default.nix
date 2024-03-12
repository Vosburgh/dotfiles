{ config, lib, pkgs, ... }:

{
  # Add options for Gtk, toolkit for gnome
  options.gtk.config.enable = lib.mkEnableOption "gtk.config";

  # Configure Gtk if desired
  config = lib.mkIf config.gtk.config.enable {

  gtk = {
    enable = true;
    font = {
      name = "Fira Code 9";
    };
    iconTheme = {
      name = "Pop";
      package = pkgs.pop-icon-theme;
    };
    theme = {
      name = "Pop";
      package = pkgs.pop-gtk-theme;
    };
    gtk3 = {
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