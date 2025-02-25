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
    (import ./starship/starship.nix {
      inherit lib;
      inherit (home) username;
    })
    ./bash.nix
    ./git.nix
    # ./gnome.nix
    # ./hyprland/hyprland.nix
    # ./hyprland/eww.nix
  ];

  home.sessionVariables = {
    FOO = "Hello";
    BAR = "${config.home.sessionVariables.FOO} World!";
  };

  home.packages = with pkgs; [
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

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
