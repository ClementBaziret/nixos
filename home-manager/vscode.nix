{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      # Graphical extensions
      jdinhlife.gruvbox

      # Utility extensions
      vscode-icons-team.vscode-icons
      eamodio.gitlens
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      adpyke.codesnap

      # Code language extensions
      ms-vscode.cpptools
      dart-code.flutter
      dart-code.dart-code
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      rust-lang.rust-analyzer
      haskell.haskell

      # Nix related extensions
      bbenoist.nix
      jnoortheen.nix-ide
      # mkhl-direnv
    ];

    keybindings = [
      {
        key = "ctrl+[Quote]";
        command = "terminal.focus";
        when = null;
      }
    ];

    userSettings = {
      "terminal.integrated.fontFamily" = "MartianMono Nerd Font";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.tabs.focusMode" = "singleClick";
      "terminal.integrated.defaultLocation" = "view";
      "terminal.integrated.shellIntegration.enabled" = false;

      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "workbench.iconTheme" = "vscode-icons";

      "files.autoSave" = "onFocusChange";

      "editor.hover.delay" = 450;

      "[dart]" = {
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;

        "editor.rulers" = [ 80 ];
        "editor.selectionHighlight" = false;
        "editor.tabCompletion" = "onlySnippets";
        "editor.wordBasedSuggestions" = "off";
      };

      "codesnap.roundedCorners" = true;
      "codesnap.realLineNumbers" = false;
      "codesnap.showWindowControls" = false;
      "codesnap.showWindowTitle" = true;
      "codesnap.shutterAction" = "copy";
      "codesnap.target" = "container";
      "codesnap.transparentBackground" = true;
      "codesnap.showLineNumbers" = true;
    };
  };

}