{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-panel
    gnomeExtensions.vitals
    gnomeExtensions.pop-shell
    # gnomeExtensions.appindicator
    # gnomeExtensions.places-status-indicator
    # gnomeExtensions.freon
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs; [
          gnomeExtensions.dash-to-panel.extensionUuid
          gnomeExtensions.vitals.extensionUuid
          gnomeExtensions.pop-shell.extensionUuid
          # gnomeExtensions.appindicator.extensionUuid
          # gnomeExtensions.places-status-indicator.extensionUuid
          # gnomeExtensions.freon.extensionUuid

        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control><Alt>t";
        command = "gnome-terminal";
        name = "Open Terminal";
      };
      # Configure individual extensions
      # "org/gnome/shell/extensions/dash-to-panel/" = {
      #   # brightness = 0.75;
      #   # noise-amount = 0;
      #   panel-lengths = ({"0":100,"1":100});
      #   panel-sizes = ({"0":80,"1":80});
      # };
    };
  };
}