{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 2;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "Password";
          shadow_passes = 2;
        }
      ];
    };
  };

  home.packages = with pkgs; [
    brightnessctl
    wireplumber
    playerctl
  ];

  wayland.windowManager.hyprland.settings = {
    xwayland = {
      force_zero_scaling = true;
    };

    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 2;

      # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = true;

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };

    input = {
      kb_layout = "fr";
      # kb_variant =
      # kb_model =
      # kb_options =
      # kb_rules =

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
      };
    };
    gestures = {
      workspace_swipe = true;
    };

    # hyprctl monitors all
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, 0x-1080, 1"
    ];

    "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "wofi --show drun";

    # See https://wiki.hyprland.org/Configuring/Keywords/
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, L, exec, hyprlock" # dwindle
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
