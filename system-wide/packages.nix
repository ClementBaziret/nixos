{
  pkgs,
  ...
}:

{
  services.tailscale.enable = true;
  services.printing.enable = true;
  programs.firefox.enable = true;
  programs.ssh.startAgent = true;
  # services.openssh.enable = true;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.packages =
    with pkgs;
    [ ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

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
    obsidian
    notepadqq
    gimp

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
}
