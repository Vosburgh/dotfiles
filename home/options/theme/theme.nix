{ nix-colors, ... }:
{
  imports = [
    nix-colors.homeManagerModule
  ];
  colorScheme = {
    slug = "pasque";
    name = "Pasque";
    palette = { 
      # Use Flutter Color vscode extension to see color preview
      base00 = "#271C3A";
      base01 = "#100323";
      base02 = "#3E2D5C";
      base03 = "#5D5766";
      base04 = "#BEBCBF";
      base05 = "#DEDCDF";
      base06 = "#EDEAEF";
      base07 = "#BBAADD";
      base08 = "#A92258";
      base09 = "#918889";
      base0A = "#804ead";
      base0B = "#C6914B";
      base0C = "#7263AA";
      base0D = "#8E7DC6";
      base0E = "#953B9D";
      base0F = "#59325C";
    };
  };
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