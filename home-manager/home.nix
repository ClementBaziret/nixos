{ config, pkgs, lib, ... }:

rec
{
  home.username = "cbaziret";
  home.homeDirectory = "/home/cbaziret";
  
  home.stateVersion = "24.11";
  
  imports = [
    ./vscode.nix
    ./gnome.nix
    ./bash.nix
    ./git.nix
    (import ./starship/starship.nix {inherit lib; inherit (home) username;})
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
