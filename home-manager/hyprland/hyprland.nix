{
  config,
  pkgs,
  lib,
  ...
}:

{

  imports = [
    ./settings.nix
    ./eww.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
  };
}
