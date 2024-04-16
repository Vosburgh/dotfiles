{ inputs, config, lib, pkgs, ... }:
let colors = {
  color_fg0 = "#fbf1c7";
  color_bg1 = "#3c3836";
  color_bg3 = "#665c54";
  color_blue = "#458588";
  color_aqua = "#689d6a";
  color_green = "#98971a";
  color_orange = "#d65d0e";
  color_purple = "#b16286";
  color_red = "#cc241d";
  color_yellow = "#d79921";
};
in
{
  # Add options for starship, a wayland window manager
  options.starship.enable = lib.mkEnableOption "starship";

  # Enable starship if desired
  config = lib.mkIf config.starship.enable {
     programs.starship = {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;

        settings = {
          right_format = "$cmd_duration";
          add_newline = false;
          format = lib.concatStringsSep "" [
            "[](${colors.color_orange})$os$username"
            "[](bg:${colors.color_yellow} fg:${colors.color_orange})$directory"
            "[](fg:${colors.color_yellow} bg:${colors.color_aqua})$git_branch$git_status"
            "[](fg:${colors.color_aqua} bg:${colors.color_blue})$c$rust$golang$nodejs$php$java$kotlin$haskell$python"
            "[](fg:${colors.color_blue} bg:${colors.color_bg3})$docker_context$conda"
            "[](fg:${colors.color_bg3} bg:${colors.color_bg1})$time"
            "[ ](fg:${colors.color_bg1})$line_break$character"
          ];

            os = {
              disabled = false;
              style = "bg:${colors.color_orange} fg:${colors.color_fg0}";
              symbols = {
                Windows = "󰍲";
                Ubuntu = "󰕈";
                SUSE = "";
                Raspbian = "󰐿";
                Mint = "󰣭";
                Macos = "󰀵";
                Manjaro = "";
                Linux = "󰌽";
                Gentoo = "󰣨";
                Fedora = "󰣛";
                Alpine = "";
                Amazon = "";
                Android = "";
                Arch = "󰣇";
                Artix = "󰣇";
                CentOS = "";
                Debian = "󰣚";
                Redhat = "󱄛";
                RedHatEnterprise = "󱄛";
              };
            };

            username = {
              show_always = true;
              style_user = "bg:${colors.color_orange} fg:${colors.color_fg0}";
              style_root = "bg:${colors.color_orange} fg:${colors.color_fg0}";
              format = "[ \$user ](\$style)";
            };

            directory = {
              style = "fg:${colors.color_fg0} bg:${colors.color_yellow}";
              format = "[ \$path ](\$style)";
              truncation_length = 3;
              truncation_symbol = "…/";
              substitutions = {
                Documents = "󰈙 ";
                Downloads = " ";
                Music = "󰝚 ";
                Pictures = " ";
                Developer = "󰲋 ";
              };
            };

            git_branch = {
              symbol = "";
              style = "bg:${colors.color_aqua}";
              format = "[[ \$symbol \$branch ](fg:${colors.color_fg0} bg:${colors.color_aqua})](\$style)";
            };

            git_status = {
              style = "bg:${colors.color_aqua}";
              format = "[[(\$all_status\$ahead_behind )](fg:${colors.color_fg0} bg:${colors.color_aqua})](\$style)";
            };

            nodejs = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            c = {
              symbol = " ";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            rust = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            golang = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            php = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            java = {
              symbol = " ";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            kotlin = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            haskell = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            python = {
              symbol = "";
              style = "bg:${colors.color_blue}";
              format = "[[ \$symbol( \$version) ](fg:${colors.color_fg0} bg:${colors.color_blue})](\$style)";
            };

            docker_context = {
              symbol = "";
              style = "bg:${colors.color_bg3}";
              format = "[[ \$symbol( \$context) ](fg:${colors.color_fg0} bg:${colors.color_bg3})](\$style)";
            };

            conda = {
              style = "bg:${colors.color_bg3}";
              format = "[[ \$symbol( \$environment) ](fg:${colors.color_fg0} bg:${colors.color_bg3})](\$style)";
            };

            time = {
              disabled = false;
              time_format = "%R";
              style = "bg:${colors.color_bg1}";
              format = "[[  \$time ](fg:${colors.color_fg0} bg:${colors.color_bg1})](\$style)";
            };

            line_break = {
              disabled = false;
            };

            character = {
              disabled = false;
              success_symbol = "[](bold fg:${colors.color_green})";
              error_symbol = "[](bold fg:${colors.color_red})";
              vimcmd_symbol = "[](bold fg:${colors.color_green})";
              vimcmd_replace_one_symbol = "[](bold fg:${colors.color_purple})";
              vimcmd_replace_symbol = "[](bold fg:${colors.color_purple})";
              vimcmd_visual_symbol = "[](bold fg:${colors.color_yellow})";
            };




          # palette = "tokyonight";
          # palettes.tokyonight = {
          #   green = "#73daca";
          #   red = "#f7768e";
          #   black = "#414868";
          #   yellow = "#e0af68";
          #   blue = "#7aa2f7";
          #   magenta = "#bb9af7";
          #   cyan = "#7dcfff";
          #   white = "#c0caf5";
          # };
          # username = {
          #   show_always = true;
          #   format = "[$user@]($style)";
          #   style_user = "magenta";
          # };
          # hostname = {
          #   ssh_only = false;
          #   style = "magenta";
          # };
          # directory = {
          #   truncation_length = 8;
          #   truncation_symbol = ".../";
          #   style = "cyan";
          # };
          # shell = {
          #   disabled = false;
          #   fish_indicator = "[󰈺](green)"; # Use nerd font symbols
          #   bash_indicator = "[](green)";
          #   zsh_indicator = "[󰞷](green)";
          # };
          # os = {
          #   disabled = false;
          #   symbols = {
          #     Arch = "[󰣇](blue) ";
          #     EndeavourOS = "[󰣇](blue) ";
          #     NixOS = "[](blue) ";
          #   };
          # };
          # line_break.disabled = true;
          # character.error_symbol = "[✗](bold red) ";
          # fill.symbol = " ";
          # custom.date = {
          #   command = "date +%a' '%b' '%d' '%H:%M:%S";
          #   when = true;
          #   style = "magenta";
          # };

          # directory = {
          #   format = "[ ](bold #89b4fa)[ $path ]($style)";
          #   style = "bold #b4befe";
          # };

          # character = {
          #   success_symbol = "[ ](bold #89b4fa)[ ➜](bold green)";
          #   error_symbol = "[ ](bold #89b4fa)[ ➜](bold red)";
          #   # error_symbol = "[ ](bold #89dceb)[ ✗](bold red)";
          # };

          # cmd_duration = {
          #   format = "[]($style)[[󰔚 ](bg:#161821 fg:#d4c097 bold)$duration](bg:#161821 fg:#BBC3DF)[ ]($style)";
          #   disabled = false;
          #   style = "bg:none fg:#161821";
          # };        

          # directory.substitutions = {
            # "~" = "󰋞";
            # "Documents" = " ";
            # "Downloads" = " ";
            # "Music" = " ";
            # "Pictures" = " ";
          # };
      };
    };
  };
}