{
  config,
  pkgs,
  lib,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    # hyprctl monitors all
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, 0x-1080, 1"
    ];
  };
}
