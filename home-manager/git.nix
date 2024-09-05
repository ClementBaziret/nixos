{ config, pkgs, lib, ... }:

{
programs.git = {
    enable = true;
    userName = "Clément Baziret";
    userEmail = "clement.baziret@epitech.eu";
    prompt.enable = true;
    config = {
      init.defaultBranch = "main";
      # url = {
      #   "https://github.com/" = {
      #     insteadOf = [
      #       "gh:"
      #       "github:"
      #     ];
      #   };
      # };
    };
  };
}