{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  services.tailscale.enable = true;
  services.printing.enable = true;
  programs.firefox.enable = true;
  # services.openssh.enable = true;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  environment.systemPackages = with pkgs; [
    # Nix important packages
    home-manager
    neofetch

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
    mediawriter
    grub2
    gparted
    zip
    unzip
    gnutar
    nixfmt-rfc-style
    nixd
    libreoffice-still
    btop
    lazygit
    rustdesk
    remmina

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
}
