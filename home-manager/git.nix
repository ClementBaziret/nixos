{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "Clément Baziret";
    userEmail = "clement.baziret@epitech.eu";
    # user = {
    #   email = "bob@work.example.com";
    #   name = "Bob Work";
    # };
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