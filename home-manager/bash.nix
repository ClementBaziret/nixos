{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    git = true;
    icons = "auto";
  };

  programs.bash = rec {
    enable = true;
    enableCompletion = true;
    initExtra = "";
    shellAliases = {
      # NixOS related aliases
      rebuild-hm = "home-manager switch --flake /home/cbaziret/dotfiles/home-manager/#cbaziret";
      configuration-doc = "man configuration.nix";
      home-manager-doc = "man home-configuration.nix";

      # Git aliases
      gs = "git status";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gp = "git push";
      gf = "git fetch";
      gpl = "git pull";
      gcl = "git clone";
      gsth = "git stash";
      gsthp = "git stash pop";
      gsw = "git switch";
      gm = "git merge";
      grb = "git rebase";
      gl = "git log";
      gd = "git diff";

      # Docker aliases
      dc = "docker-compose";

      # SSH key aliases
      "new-ssh-key" = "ssh-keygen -t ed25519 -C 'clement.baziret@epitech.eu'";

      # Utility aliases
      # cat = "bat";
      tree = "eza -T";
      net-mg = "nmtui";
    };

    bashrcExtra =
      let
        foldOnAttributes =
          f:
          lib.attrsets.foldlAttrs (
            acc: name: _:
            f acc name
          );
        complete-alias-commands = foldOnAttributes (
          acc: aliasName:
          acc
          + ''
            complete -F _complete_alias ${aliasName}
          ''
        ) "" shellAliases;
      in
      ''
        ${complete-alias-commands}
        
        # Source global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi

        # User specific environment
        if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
            PATH="$HOME/.local/bin:$HOME/bin:$PATH"
        fi
        export PATH

        # Add nix in PATH
        source $HOME/.nix-profile/etc/profile.d/nix.sh
      '';
  };
}
