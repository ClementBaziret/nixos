{
  config,
  pkgs,
  lib,
  vscode-extensions,
  ...
}:

rec {
  home.username = "cbaziret";
  home.homeDirectory = "/home/cbaziret";

  home.stateVersion = "24.11";

  imports = [
    (import ./vscode.nix {
      pkgs = pkgs;
      inherit lib;
      inherit vscode-extensions;
    })
    ./gnome.nix
    ./bash.nix
    ./git.nix
    (import ./starship/starship.nix {
      inherit lib;
      inherit (home) username;
    })
  ];

  home.sessionVariables = {
    FOO = "Hello";
    BAR = "${config.home.sessionVariables.FOO} World!";
  };

  home.packages = with pkgs; [

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.eww = {
    enable = true;
    enableBashIntegration = true;
    configDir = pkgs.eww;
    # configDir = ./eww-config-dir;
    # configDir = /home/cbaziret/.config/eww;
  };

  # wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    extraConfig = ''

    '';
    settings = {
      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "fr";
        # kb_variant =
        # kb_model =
        # kb_options =
        # kb_rules =

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
      };

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      # See https://wiki.hyprland.org/Configuring/Keywords/
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      "bind" = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
      ];

    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary
  # way to manage plain files is through 'home.file'.
  home.file = {
    ".bash_completion".text = ''
      COMPAL_AUTO_UNMASK=1
      source ${pkgs.complete-alias}/bin/complete_alias
    '';
  };

  programs.home-manager.enable = true;
}
