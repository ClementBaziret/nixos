{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    user = {
      email = "bob@work.example.com";
      name = "Bob Work";
    };
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