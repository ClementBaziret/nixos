{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  users.users.cbaziret = {
    isNormalUser = true;
    description = "Clément Baziret";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
