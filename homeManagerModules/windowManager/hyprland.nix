{
  inputs,
  lib,
  pkgs,
  ...
}: let
  terminal = "${pkgs.foot}/bin/foot";
  layout = "latam";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  hyprpicker = "${pkgs.hyprpicker}/bin/hyprpicker";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
      # Same as dehfault, but stop graphical-session too
      variables = ["--all"];
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
        "systemctl --user import-environment QT_QPA_PLATFORMTHEME"
      ];
    };

    plugins = [
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
      #inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
  };

  # Config

  wayland.windowManager.hyprland.settings = {
    plugin = {
      hyprsplit = {
        num_workspaces = 5;
      };
    };

    exec-once = [
      "swww init"
      "waybar"
      "hyprctl setcursor Bibata-Modern-Ice 22"
    ];

    #"wl-paste --type text --watch cliphist store"
    #"wl-paste --type image --watch cliphist store"

    "$mainMod" = "SUPER";

    monitor = [
      "eDP-1, 1920x1080@60, 0x0,1"
      "HDMI-A-1, highres, auto, 1" #,mirror, eDP-1
    ];

    general = {
      gaps_in = 10;
      gaps_out = 10;
      border_size = 3;
      "col.active_border" = "rgba(d8dee9cc) rgba(595959aa) 90deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";
    };

    decoration = {
      rounding = 12;
      blur = {
        enabled = false; # For baterry
        size = 3;
        passes = 2;
        new_optimizations = true;
      };
      drop_shadow = false; # For battery
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

      animation = [
        "windows,     1, 7,  myBezier"
        "windowsOut,  1, 7,  default, popin 80%"
        "border,      1, 10, default"
        "borderangle, 1, 8,  default"
        "fade,        1, 7,  default"
        "workspaces,  1, 6,  default, slidefadevert 30%"
        "specialWorkspace, 1,6, default, slidefadevert 20%"
      ];
    };

    bind = [
      # Monitor
      "$mainMod ALT, Return, movewindow, mon:HDMI-A-1"
      "$mainMod SHIFT, Return, movewindow, mon:eDP-1"

      "$mainMod, Tab, focusmonitor, +1"

      "ALT, tab, workspace, previus_per_monitor"

      #Exec
      "$mainMod, Return, exec, ${terminal}"
      "$mainMod, Q, killactive,"
      "$mainMod SHIFT, Q, exec, poweroff"
      "$mainMod, M, exit,"
      "$mainMod, F, fullscreen, 1"
      "$mainMod SHIFT, F, fullscreen"
      "$mainMod, E, exec, dolphin"
      "$mainMod, V, togglefloating,"
      "$mainMod, Space, exec, rofi -show drun"

      #For hyprsplit space
      # #Workspace
      "$mainMod, 1, split:workspace, 1"
      "$mainMod, 2, split:workspace, 2"
      "$mainMod, 3, split:workspace, 3"
      "$mainMod, 4, split:workspace, 4"
      "$mainMod, 5, split:workspace, 5"

      # #Move Workspace
      "$mainMod SHIFT, 1, split:movetoworkspace, 1"
      "$mainMod SHIFT, 2, split:movetoworkspace, 2"
      "$mainMod SHIFT, 3, split:movetoworkspace, 3"
      "$mainMod SHIFT, 4, split:movetoworkspace, 4"
      "$mainMod SHIFT, 5, split:movetoworkspace, 5"

      #Scratchpad
      "$mainMod, A, togglespecialworkspace, magic"
      "$mainMod SHIFT, A,movetoworkspace, special:magic"

      "$mainMod, S, togglespecialworkspace, scratchpad"
      "$mainMod SHIFT, S, movetoworkspace, special:scratchpad"

      "$mainMod SHIFT, C, exec, ${hyprpicker} -a"
      #Audio
      ", xf86audioraisevolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+"
      ", xf86audiolowervolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-"
      ", xf86audiomute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

      #Screennshots
      ''SHIFT, Print, exec, grim -g "$(slurp -w 0 -b 000000AA)" - | ${wl-copy} -t image/png''
      ''$mainMod SHIFT, S, exec, grim -g "$(slurp -w 0 -b 000000AA" - | ${wl-copy} -t image/png''
      '',Print, exec, grim -| ${wl-copy} -t image/png''

      # # send focused workspace to left/right monitors
      #"$mainmod SHIFT ALT, bracketleft, movecurrentworkspacetomonitor, +1"

      #Swap active workspaces
      "$mainmod ALT, bracketleft,split:swapactiveworkspaces, eDP-1 HDMI-A-1"
    ];

    binds = {
      #See more in: https://github.com/hyprwm/Hyprland/issues/6641
      allow_workspace_cycles = true;
    };

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "bordercolor rgba(88c0d0aa), fullscreen:1"
      # Should try this
    ];

    input = {
      kb_layout = "${layout}";
      numlock_by_default = true;
      follow_mouse = 1;

      touchpad = {
        natural_scroll = false;
      };

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      vfr = true;
    };
  };

  home.packages = with pkgs; [
    waybar
    swaynotificationcenter
    rofi-wayland
    brightnessctl
    # xdg-desktop-portal-hyprland
  ];
}
