{ imports, config, lib, pkgs, ... }: {

  # Add options for dunst
  options.dunst.enable = lib.mkEnableOption "dunst";

  # Configure dunst if desired
  config = lib.mkIf config.dunst.enable {
    home.packages = with pkgs; [ 
      dunst
      libnotify
      ];

    services.dunst = {
      enable = true;
      iconTheme = {
        name = "Adwaita-Dark";
        package = pkgs.gnome.adwaita-icon-theme;
      };
      settings = {
        global = {
          rounded = "yes";
          origin = "top-right";
          monitor = "0";
          alignment = "left";
          vertical_alignment = "top";
          width = "400";
          height = "400";
          scale = 0;
          gap_size = 0;
          progress_bar = true;
          transparency = 0;
          text_icon_padding = 0;
          separator_color = "frame";
          sort = "yes";
          idle_threshold = 120;
          line_height = 0;
          markup = "full";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = true;
          sticky_history = "yes";
          history_length = 20;
          always_run_script = true;
          corner_radius = 12;
          follow = "mouse";
          font = "Fira Code 9";
          format = "<b>%s</b>\\n%b";
          progress_bar_corner_radius = 12 - 10;
          #format = ''
          #  <span foreground='#${config.theme.colors.primary-bg}'><b>%s %p</b></span>
          #  %b'';
          frame_color = "#" + config.colorScheme.palette.base00;
          highlight = "#" + config.colorScheme.palette.base0E;
          foreground = "#" + config.colorScheme.palette.base05;
          frame_width = 1;
          offset = "0x10";
          horizontal_padding = 10;
          icon_position = "left";
          indicate_hidden = "yes";
          min_icon_size = 0;
          max_icon_size = 64;
          mouse_left_click = "open_url, close_current";
          mouse_middle_click = "close_all";
          mouse_right_click = "context";
          padding = 10;
          plain_text = "no";
          separator_height = 2;
          show_indicators = "yes";
          shrink = "no";
          word_wrap = "yes";
          browser = "${pkgs.firefox}/bin/firefox";
        };

        fullscreen_delay_everything = { fullscreen = "delay"; };

        urgency_critical = {
          background = "#" + config.colorScheme.palette.base08 + "85";
          foreground = "#" + config.colorScheme.palette.base00;
          timeout = 0;
        };
        urgency_low = {
          background = "#" + config.colorScheme.palette.base01 + "85";
          foreground = "#" + config.colorScheme.palette.base05;
          timeout = 5;

        };
        urgency_normal = {
          background = "#" + config.colorScheme.palette.base01 + "85";
          foreground = "#" + config.colorScheme.palette.base05;
          timeout = 5;
        };
      };
    };
  };
}