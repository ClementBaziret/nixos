{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.variant = "oss";
  console.keyMap = "fr";
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  services.displayManager.defaultSession = "plasma";
}
