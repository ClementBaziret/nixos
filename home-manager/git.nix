{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "Clément Baziret";
    userEmail = "clement.baziret@epitech.eu";
    extraConfig = {
      init.defaultBranch = "main";
      prompt.enable = true;
    };
  };
}
