{
  pkgs,
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

  # environment.plasma6.excludePackages = with pkgs; [
  #   kdePackages.elisa
  # ];

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  services.displayManager.defaultSession = "plasma";
}
