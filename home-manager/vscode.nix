{ config, pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      # equinusocio.vsc-material-theme-icons

      # bbenoist.nix
      # dart-code.dart-code
      # dart-code.flutter

      # sdras.night-owl
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
      "terminal.integrated.defaultLocation" = "editor";
      "terminal.integrated.shellIntegration.enabled" = false;

      "workbench.colorTheme" = "Night Owl (No Italics)";
      "workbench.iconTheme" = "eq-material-theme-icons";

      "files.autoSave" = "onFocusChange";

      "[dart]" = {
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;

        "editor.rulers" = [ 80 ];
        "editor.selectionHighlight" = false;
        "editor.tabCompletion" = "onlySnippets";
        "editor.wordBasedSuggestions" = "off";
      };
    };
  };

}