{
  config,
  pkgs,
  lib,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    xwayland = {
      force_zero_scaling = true;
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

    "monitor" = "eDP-1, 1920x1080@144, 0x0, 1";

    "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "wofi --show drun";

    # See https://wiki.hyprland.org/Configuring/Keywords/
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    "bind" = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
    ];
  };
}
