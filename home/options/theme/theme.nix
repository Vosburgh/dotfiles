{ inputs, nix-colors, ... }:
{
  imports = [
    nix-colors.homeManagerModule
  ];
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  # colorScheme = {
  #   slug = "kanagawa";
  #   name = "kanagawa";
  #   palette = {
  #     base00 = "#1F1F28";
  #     base01 = "#2A2A37";
  #     base02 = "#223249";
  #     base03 = "#727169";
  #     base04 = "#C8C093";
  #     base05 = "#DCD7BA";
  #     base06 = "#938AA9";
  #     base07 = "#363646";
  #     base08 = "#C34043";
  #     base09 = "#FFA066";
  #     base0A = "#DCA561";
  #     base0B = "#98BB6C";
  #     base0C = "#7FB4CA";
  #     base0D = "#7E9CD8";
  #     base0E = "#957FB8";
  #     base0F = "#D27E99";
  #   };
  # };
}

# Stole this from some nerd
# colors = {
#   bg = "#040409";
#   fg = "#FCFCFC";
#   alt-bg = "#101012";
#   alt-fg = "#ECECEC";
#   primary-bg = "#a158ff";
#   primary-fg = "#000000";
#   secondary-bg = "#4928B8";
#   secondary-fg = "#000000";
#   color0 = "#000000";
#   color1 = "#f7768e";
#   color2 = "#73daca";
#   color3 = "#e0af68";
#   color4 = "#7aa2f7";
#   color5 = "#9978F8";
#   color6 = "#7dcfff";
#   color7 = "#E4E5E7";
#   color8 = "#515878";
#   color9 = "#f7869e";
#   color10 = "#83eada";
#   color11 = "#f0bf78";
#   color12 = "#8ab2f7";
#   color13 = "#A988F8";
#   color14 = "#8ddfff";
#   color15 = "#f4f5f7";
# };