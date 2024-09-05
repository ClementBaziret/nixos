{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ""; # "'echo test' 'echo test'"
    shellAliases = {
      # NixOS related aliases
      rebuild = "sudo nixos-rebuild switch --flake /home/cbaziret/nixos/#default";
      configuration-doc = "man configuration.nix";
      home-manager-doc = "man home-configuration.nix";

      # Git aliases
      gs = "git status";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gcl = "git clone";
      gsth = "git stash";
      gsthp = "git stash pop";

      # SSH key aliases
      "new-ssh-key" = "ssh-keygen -t ed25519 -C 'clement.baziret@epitech.eu'";

      # Utility aliases
      # cat = "bat";
    };
  };
}