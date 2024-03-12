# { config, pkgs, lib, ... }:
	
# {

#     # Add options for swaylock, lock screen for wayland
#   options.waybar.enable = lib.mkEnableOption "waybar";

#   # Configure swaylock if desired
#   config = lib.mkIf config.waybar.enable {
#       programs.waybar = {
#         enable = true;
#         systemd.enable = true;
#         style = "./awe/style.css";
#         settings = {
#           mainBar = {
#             layer = "top";
#             position = "top";
#             height = 33;
#             width = 3440;
#             margin = "3, 0, 2, 0";
#             modules-left = [ "custom/wmname" "hyprland/workspaces" "sway/mode" "cpu" "custom/separator" "memory" "custom/separator" "network" "custom/recorder" "custom/audiorec" ];
#             modules-center = [ "hyprland/window" "mpd" ];
#             modules-right = [ "tray" "custom/separator" "pulseaudio" "custom/separator" "clock" ];

#             modules-config = {
#               "custom/wmname" = { format = ""; tooltip = false; };
#               "hyprland/window" = { format = " {}"; separate-outputs = true; };
#               "hyprland/workspaces" = {
#                 format = "{icon}";
#                 "persistent-workspaces" = { "*" = 5; };
#                 "format-icons" = {
#                   "1" = "";
#                   "2" = "󰺷";
#                   "3" = "";
#                   "4" = "";
#                   "5" = "󰧮";
#                 };
#               };
#               "hyprland/scratchpad" = {
#                 format = "{icon} {count}";
#                 "show-empty" = false;
#                 "format-icons" = [ "" "" ];
#                 tooltip = true;
#                 "tooltip-format" = "{app}: {title}";
#               };
#               "custom/separator" = { format = "|"; interval = "once"; tooltip = false; };
#               "hyprland/mode" = { format = "<span style=\"italic\">{}</span>"; };
#               "tray" = { "icon-size" = 20; spacing = 6; };
#               "clock" = {
#                 interval = 1;
#                 locale = "C";
#                 format = "  {:%I:%M %p}";
#                 "format-alt" = "   {:%a,%b %d}";
#               };
#               "cpu" = { format = "  {usage}%"; tooltip = false; "on-click" = "kitty -e 'htop'"; };
#               "memory" = {
#                 interval = 30;
#                 format = "  {used:0.2f}GB";
#                 "max-length" = 10;
#                 tooltip = false;
#                 warning = 70;
#                 critical = 90;
#                 "on-click" = "kitty -e 'btop'";
#               };
#               "network" = {
#                 "format-wifi" = "{essid}  ({signalStrength}%)  ";
#                 "format-ethernet" = "󰈀  {ifname}";
#                 "tooltip-format" = "󰔣  {ifname} via {gwaddr}";
#                 "format-linked" = "󰱓  {ifname} (No IP)";
#                 "format-disconnected" = "Disconnected ⚠ {ifname}";
#                 "format-alt" = "󰛳  {ifname}: {ipaddr}/{cidr}";
#               };
#               "pulseaudio" = {
#                 "format" = "{icon}   {volume}%  {format_source}";
#                 "format-bluetooth" = "{icon} {volume}% {format_source}";
#                 "format-bluetooth-muted" = " {format_source}";
#                 "format-muted" = "  {format_source}";
#                 "format-source" = " {volume}%";
#                 "format-source-muted" = "";
#                 "format-icons" = {
#                   "headphone" = "";
#                   "hands-free" = "";
#                   "headset" = "🎧";
#                   "phone" = "";
#                   "portable" = "";
#                   "car" = "";
#                   "default" = [ "" "" "" ];
#                 };
#                 "on-click" = "pavucontrol";
#               };
#               "mpd" = {
#                 "format" = "{stateIcon} {artist} - {title}";
#                 "format-disconnected" = "🎶";
#                 "format-stopped" = "♪";
#                 interval = 10;
#                 "consume-icons" = { "on" = " "; };
#                 "random-icons" = { "off" = "<span color=\"#f53c3c\"></span> "; "on" = " "; };
#                 "repeat-icons" = { "on" = " "; };
#                 "single-icons" = { "on" = "1 "; };
#                 "state-icons" = { "paused" = ""; "playing" = ""; };
#                 "tooltip-format" = "MPD (connected)";
#                 "tooltip-format-disconnected" = "MPD (disconnected)";
#                 "max-length" = 45;
#               };
#             };
#         };
#       };
#     };
#   };
# }
