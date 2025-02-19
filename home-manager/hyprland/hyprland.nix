{
  config,
  pkgs,
  lib,
  ...
}:

{

  imports = [
    ./eww.nix
    ./hyprlock.nix
    ./settings
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
  };
}
