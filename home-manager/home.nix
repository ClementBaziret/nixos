{ config, pkgs, lib, ... }:

{
  home.username = "cbaziret";
  home.homeDirectory = "/home/cbaziret";
  
  home.stateVersion = "24.05";
  
  imports = [
    ./vscode.nix
    ./gnome.nix
    ./bash.nix
  ];

  home.sessionVariables = {
    FOO = "Hello";
    BAR = "${config.home.sessionVariables.FOO} World!";
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];

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

  };

  programs.home-manager.enable = true;
}
