{
  pkgs,
  ...
}:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.variant = "oss";
  console.keyMap = "fr";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # services.gnome.core-utilities.enable = false;  # disable all the gnome default applications
  environment.gnome.excludePackages = with pkgs; [
    gnome-console
    epiphany # web browser
  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-terminal
    dconf-editor
  ];
}
