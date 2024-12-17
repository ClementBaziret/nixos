{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) (lib.map lib.getName (with pkgs; [
        vscode
      ] ++ (with pkgs.vscode-extensions; [
        ms-vscode-remote.remote-ssh
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-containers
        ms-vscode.live-server
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-pylance
      ])
      )
    );

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      # Graphical extensions
      jdinhlife.gruvbox

      # Utility extensions
      ms-vscode-remote.remote-ssh
      ritwickdey.liveserver
      vscode-icons-team.vscode-icons
      eamodio.gitlens
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      adpyke.codesnap
      iliazeus.vscode-ansi
      vadimcn.vscode-lldb
      ms-vscode.live-server

      # Code language extensions
      ms-vscode.cpptools
      xaver.clang-format
      ms-vscode.cmake-tools
      twxs.cmake
      dart-code.flutter
      dart-code.dart-code
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      rust-lang.rust-analyzer
      haskell.haskell
      vue.volar
      ecmel.vscode-html-css

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

      # Needed in order to make interactive shells work in vscode
      "terminal.integrated.profiles.linux" = {
        "bash" = {
            "path" = "~/.bashrc";
            "icon" = "terminal-bash";
        };
      };

      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "workbench.iconTheme" = "vscode-icons";

      "files.autoSave" = "onFocusChange";

      # "editor.formatOnSave" = true;
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