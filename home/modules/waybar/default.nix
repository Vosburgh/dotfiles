{ inputs, config, pkgs, lib, ... }:
	
{
    # Add options for swaylock, lock screen for wayland
  options.waybar.enable = lib.mkEnableOption "waybar";

  # Configure swaylock if desired
  config = lib.mkIf config.waybar.enable {
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        style = (builtins.readFile ./awe/style.css);
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            height = 34;
            width = 3440;
            margin = "3, 0, 2, 0";

            modules-left = [ 
              "custom/wmname" 
              "hyprland/workspaces" 
              "sway/mode" 
              "cpu" 
              "custom/separator" 
              "memory" 
              "custom/separator" 
              "network" 
              "custom/recorder" 
              "custom/audiorec" 
              ];
            modules-center = [ 
              "cava"
              "custom/separator" 
              "hyprland/window" 
              "custom/separator" 
              "cava"
              ];

            modules-right = [ 
              "tray" 
              "custom/separator" 
              "bluetooth"
              "custom/separator" 
              "pulseaudio" 
              "custom/separator" 
              "clock" 
              ];
              
            "custom/wmname" = { format = ""; tooltip = false; };
            "hyprland/window" = { format = " {}"; separate-outputs = true; };
            "hyprland/workspaces" = {
              format = "{icon}";
              "on-scroll-up" = "hyprctl dispatch workspace e+1";
              "on-scroll-down" = "hyprctl dispatch workspace e-1";  
              "persistent-workspaces" = { "*" = 5; };
              "format-icons" = {
                "1" = "";
                "2" = "󰺷";
                "3" = "";
                "4" = "";
                "5" = "󰧮";
              };
            };

            bluetooth = {
              format-on = "󰂯 ";
              format-connected = "󰂯 ";
              format-disabled = "󰂲 ";
              tooltip-format = "{controller_alias}\t{controller_address}";
              tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
              tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            };

            "hyprland/scratchpad" = {
              format = "{icon} {count}";
              "show-empty" = false;
              "format-icons" = [ "" "" ];
              tooltip = true;
              "tooltip-format" = "{app}: {title}";
            };
            
            "custom/separator" = { 
              format = "|"; 
              interval = "once"; 
              tooltip = false; 
            };
            
            "hyprland/mode" = { 
              format = "<span style=\"italic\">{}</span>"; 
            };
            
            tray = { 
              "icon-size" = 20; 
              spacing = 6; 
            };

            clock = {
              interval = 1;
              locale = "C";
              format = "  {:%I:%M %p}";
              "format-alt" = "   {:%a,%b %d}";
            };

            cpu = { 
              format = "  {usage}%"; 
              tooltip = false; 
              "on-click" = "kitty -e 'htop'"; 
            };

            memory = {
              interval = 30;
              format = "  {used:0.2f}GB";
              "max-length" = 10;
              tooltip = false;
              warning = 70;
              critical = 90;
              "on-click" = "kitty -e 'btop'";
            };

            network = {
              "format-wifi" = "{essid}  ({signalStrength}%)  ";
              "format-ethernet" = "󰈀  {ifname}";
              "tooltip-format" = "󰔣  {ifname} via {gwaddr}";
              "format-linked" = "󰱓  {ifname} (No IP)";
              "format-disconnected" = "Disconnected ⚠ {ifname}";
              "format-alt" = "󰛳  {ifname}: {ipaddr}/{cidr}";
            };
            "pulseaudio" = {
              "format" = "{icon}   {volume}%  {format_source}";
              "format-bluetooth" = "{icon} {volume}% {format_source}";
              "format-bluetooth-muted" = " {format_source}";
              "format-muted" = "  {format_source}";
              "format-source" = " {volume}%";
              "format-source-muted" = "";
              "format-icons" = {
                "headphone" = "";
                "hands-free" = "";
                "headset" = "🎧";
                "phone" = "";
                "portable" = "";
                "car" = "";
                "default" = [ "" "" "" ];
              };
              "on-click" = "pavucontrol";
            };
            # "mpd" = {
            #   "format" = "{stateIcon} {artist} - {title}";
            #   "format-disconnected" = "🎶";
            #   "format-stopped" = "♪";
            #   interval = 10;
            #   "consume-icons" = { "on" = " "; };
            #   "random-icons" = { "off" = "<span color=\"#f53c3c\"></span> "; "on" = " "; };
            #   "repeat-icons" = { "on" = " "; };
            #   "single-icons" = { "on" = "1 "; };
            #   "state-icons" = { "paused" = ""; "playing" = ""; };
            #   "tooltip-format" = "MPD (connected)";
            #   "tooltip-format-disconnected" = "MPD (disconnected)";
            #   "max-length" = 45;
            # };
            cava = {
              align = 1;
              min-length = 35;
              max-length = 35;
              tooltip = false;
              hide_on_silence = false;
              framerate = 30;
              bars = 10;
              # method = "pulse";
              # source = "auto";
              bar_delimiter = 0;
              input_delay = 1;
              format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
            };
        };
      };
    };
      programs.cava.enable = true;
  };
}
