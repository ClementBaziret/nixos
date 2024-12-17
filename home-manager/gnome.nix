{
  config,
  pkgs,
  lib,
  ...
}:

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
          gnomeExtensions.quick-settings-tweaker.extensionUuid
          # gnomeExtensions.appindicator.extensionUuid
          # gnomeExtensions.places-status-indicator.extensionUuid
          # gnomeExtensions.freon.extensionUuid
        ];
      };
      # Gnome general settings
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

      # Gnome extensions settings
      # "org/gnome/shell/extensions/dash-to-panel/" = {
      #   # brightness = 0.75;
      #   # noise-amount = 0;
      #   panel-lengths = ({"0":100,"1":100});
      #   panel-sizes = ({"0":80,"1":80});
      # };
    };
  };

  # Gnome Terminal dconf paths
  # /org/gnome/terminal/legacy/profiles:/list -> list of profiles
  # /org/gnome/terminal/legacy/profiles:/:uuid/ -> access a profile
  # /org/gnome/terminal/legacy/profiles:/:57fff6a1-acae-4d70-8807-51f5523d512e

  programs.gnome-terminal = {
    enable = true;
    # showMenubar = false;

    profile = {
      "2856b679-dc91-4978-b668-5e0d6550f1c8" = {
        default = true;
        visibleName = "my-config";
        font = "FiraMono Nerd Font 12";
      };
    };
  };
}
