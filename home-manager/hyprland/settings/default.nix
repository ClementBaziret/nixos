{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./general.nix
    ./input.nix
    ./keybindings.nix
    ./monitors.nix
  ];

  wayland.windowManager.hyprland.settings = {
    xwayland = {
      force_zero_scaling = true;
    };
  };
}
