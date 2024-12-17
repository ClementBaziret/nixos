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
  };
}
