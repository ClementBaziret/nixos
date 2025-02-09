{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  home-manager-path = ./home-manager/home.nix;
in
{
  imports = [
    ./hardware-configuration.nix
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

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024; # 16GB
    }
  ];

  users.users.cbaziret = {
    isNormalUser = true;
    description = "Clément Baziret";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = 1;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  # # services.gnome.core-utilities.enable = false;  # disable all the gnome default applications
  # environment.gnome.excludePackages = with pkgs; [
  #   gnome-console
  #   epiphany # web browser
  # ];

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

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libxl
    glibc
    gcc.cc.lib
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "cbaziret" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.dragAndDrop = true;
  # virtualisation.virtualbox.guest.clipboard = true;

  networking.firewall.allowedUDPPorts = [ 8080 ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.enable = false;

  # List of the nix packages installed system-wide
  environment.systemPackages = with pkgs; [
    # Nix important packages
    home-manager
    neofetch
    steam-run # to use for classic linux distros

    # User softwares
    vim
    vscode
    discord
    teams-for-linux
    tuxpaint
    filezilla

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
    nerdfonts
    mediawriter
    grub2
    gparted
    zip
    unzip
    gnutar
    nixfmt-rfc-style
    nixd
    libreoffice-still

    # # Gnome related
    # gnome-tweaks
    # gnome-terminal
    # dconf-editor

    # man and documentation
    man
    stdmanpages
    llvm-manpages
    man-pages
    man-pages-posix
    kitty
    wofi
    dolphin
  ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-29.4.6"
  # ];

  # services.openssh.enable = true;

  system.stateVersion = "24.05";
}
