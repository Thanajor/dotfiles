{pkgs, ...}: let
  mod = "Mod4";
  alt = "Mod1";
  term = "${pkgs.foot}/bin/foot";
in {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      input = {
        "*" = {
          xkb_layout = "latam";
          natural_scroll = "disabled";
        };
      };
      keybindings = {
        "${mod}+Return" = "exec ${term}";
        "${mod}+w" = "exec firefox";
        "${alt}+q" = "kill";
        "${mod}+v" = "floating toggle";
        "${mod}+s" = "scratchpad show";
        "${mod}+Shift+s" = "move scratchpad";
        "${mod}+f" = "fullscreen toggle";
      };
      floating = {
        modifier = mod;
      };
      focus = {
        followMouse = true;
      };
    };
  };
  # extraConfig =
  # ''
  #   bindsym --locked XF86MonBrightnessUp exec ${helpers.brightness.up}
  #   bindsym --locked XF86MonBrightnessDown exec ${helpers.brightness.down}
  #   bindsym --locked XF86AudioRaiseVolume exec ${helpers.volume.up}
  #   bindsym --locked XF86AudioLowerVolume exec ${helpers.volume.down}
  #   bindsym --locked XF86AudioMute exec ${helpers.volume.mute}
  #   bindsym --locked XF86AudioMicMute exec ${helpers.volume.micMute}
  #   bindsym --locked XF86AudioPlay exec ${helpers.media.play}
  #   bindsym --locked XF86AudioPrev exec ${helpers.media.prev}
  #   bindsym --locked XF86AudioNext exec ${helpers.media.next}
  #
  #   default_border pixel 4
  #   default_floating_border pixel 4
  # '';
  # # + lib.strings.optionalString (config.wayland.windowManager.sway.package
  #   == pkgs.swayfx) ''
  #   blur enable
  #   blur_passes 2
  #
  #   # corner_radius ${toString cfg.theme.borders.radius}
  #   shadows enable
  #   shadows_on_csd enable
  #   shadow_color ${config.lib.stylix.colors.withHashtag."base00"}CC
  #
  #   default_dim_inactive 0.05
  #
  #   layer_effects gtk-layer-shell blur enable
  #   layer_effects gtk-layer-shell blur_ignore_transparent enable
  #   layer_effects launcher blur enable
  #   layer_effects launcher blur_ignore_transparent enable
  #   layer_effects logout_dialog blur enable
  #   layer_effects notifications blur enable
  #   layer_effects notifications blur_ignore_transparent enable
  #   layer_effects rofi blur enable
  #   layer_effects rofi blur_ignore_transparent enable
  #   layer_effects swaybar blur enable
  #   layer_effects swaybar blur_ignore_transparent enable
  #   layer_effects swayosd blur enable
  #   layer_effects swayosd blur_ignore_transparent enable
  #   layer_effects waybar blur enable
  #   layer_effects waybar blur_ignore_transparent enable
  # '';
}
