# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let 
  home-manager-path = ./home-manager/home.nix;
in 
{
  imports =
    [
      ./system-wide/hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.variant = "oss";
  console.keyMap = "fr";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  users.users.cbaziret = {
    isNormalUser = true;
    description = "Clément Baziret";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
    ];
  };

  home-manager = {
    # also pass inputs to home-manager modules
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {inherit inputs;};
    users = {
      "cbaziret" = import home-manager-path;
    };
  };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # services.gnome.core-utilities.enable = false;  # disable all the gnome default applications 
  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  boot.loader.grub.configurationLimit = 15;

  programs.git.config = {
    init.defaultBranch = "main";
    prompt.enable = true;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable some dev documentation
  documentation.dev.enable = true;

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List of the nix packages installed system-wide
  environment.systemPackages = with pkgs; [
    # Nix important packages
    home-manager
    neofetch

    # User softwares
    vim
    vscode
    discord
    teams-for-linux
    google-chrome

    # Utility software
    git
    gh
    pkg-config
    bat
    wget
    tree
    zsh
    sqlite
    postman
    docker-compose

    # Gnome related
    gnome.gnome-tweaks
    gnome.gnome-terminal
    gnome.dconf-editor

    # man and documentation
    man
    stdmanpages
    llvm-manpages
    man-pages
    man-pages-posix
  ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-29.4.6"
  # ];

  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
