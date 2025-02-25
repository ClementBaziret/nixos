{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
in
{
  imports = [
    ./hardware-configuration.nix
    ./desktop-manager
    ./locales.nix
    ./audio.nix
    ./network.nix
    ./user.nix
    ./packages.nix
    # ./virtualbox.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 15;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libxl
    glibc
    gcc.cc.lib
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024; # 16GB
    }
  ];

  # Enable some dev documentation
  documentation.dev.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  system.stateVersion = "24.05";
}
