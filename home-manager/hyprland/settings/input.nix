{
  config,
  pkgs,
  lib,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
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
  };
}
