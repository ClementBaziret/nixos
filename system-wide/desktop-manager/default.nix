{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    # ./gnome.nix
    ./kde-plasma.nix
    # ./hyprland.nix
  ];
}
