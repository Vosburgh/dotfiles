{ inputs, config, lib, pkgs, ... }:
let colorScheme = config.colorScheme.palette;
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
            "[](#${config.colorScheme.palette.base08})$os$username"
            "[](bg:#${config.colorScheme.palette.base0A} fg:#${config.colorScheme.palette.base08})$directory"
            "[](fg:#${config.colorScheme.palette.base0A} bg:#${config.colorScheme.palette.base0B})$git_branch$git_status"
            "[](fg:#${config.colorScheme.palette.base0B} bg:#${config.colorScheme.palette.base0C})$c$rust$golang$nodejs$php$java$kotlin$haskell$python"
            "[](fg:#${config.colorScheme.palette.base0C} bg:#${config.colorScheme.palette.base03})$docker_context$conda"
            "[](fg:#${config.colorScheme.palette.base03} bg:#${config.colorScheme.palette.base01})$time"
            "[ ](fg:#${config.colorScheme.palette.base01})$line_break$character"
          ];

            os = {
              disabled = false;
              style = "bg:#${config.colorScheme.palette.base08} fg:#${config.colorScheme.palette.base00}";
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
              style_user = "bg:#${config.colorScheme.palette.base08} fg:#${config.colorScheme.palette.base05}";
              style_root = "bg:#${config.colorScheme.palette.base08} fg:#${config.colorScheme.palette.base05}";
              format = "[ \$user ](\$style)";
            };

            directory = {
              style = "fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0A}";
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
              style = "bg:#${config.colorScheme.palette.base0B}";
              format = "[[ \$symbol \$branch ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0B})](\$style)";
            };

            git_status = {
              style = "bg:#${config.colorScheme.palette.base0B}";
              format = "[[(\$all_status\$ahead_behind )](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0B})](\$style)";
            };

            nodejs = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            c = {
              symbol = " ";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            rust = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            golang = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            php = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            java = {
              symbol = " ";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            kotlin = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            haskell = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            python = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base0C}";
              format = "[[ \$symbol( \$version) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base0C})](\$style)";
            };

            docker_context = {
              symbol = "";
              style = "bg:#${config.colorScheme.palette.base03}";
              format = "[[ \$symbol( \$context) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base03})](\$style)";
            };

            conda = {
              style = "bg:#${config.colorScheme.palette.base03}";
              format = "[[ \$symbol( \$environment) ](fg:#${config.colorScheme.palette.base00} bg:#${config.colorScheme.palette.base03})](\$style)";
            };

            time = {
              disabled = false;
              time_format = "%R";
              style = "bg:#${config.colorScheme.palette.base01}";
              format = "[[  \$time ](fg:#${config.colorScheme.palette.base05} bg:#${config.colorScheme.palette.base01})](\$style)";
            };

            line_break = {
              disabled = false;
            };

            character = {
              disabled = false;
              success_symbol = "[](bold fg:#${config.colorScheme.palette.base0B})";
              error_symbol = "[](bold fg:#${config.colorScheme.palette.base08})";
              vimcmd_symbol = "[](bold fg:#${config.colorScheme.palette.base0B})";
              vimcmd_replace_one_symbol = "[](bold fg:#${config.colorScheme.palette.base0E})";
              vimcmd_replace_symbol = "[](bold fg:#${config.colorScheme.palette.base0E})";
              vimcmd_visual_symbol = "[](bold fg:#${config.colorScheme.palette.base0A})";
            };
      };
    };
  };
}