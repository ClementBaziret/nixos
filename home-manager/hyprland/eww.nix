{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.eww = {
    enable = true;
    enableBashIntegration = true;
    configDir = pkgs.eww;
  };
}
