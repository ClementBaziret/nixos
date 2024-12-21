{
  pkgs,
  lib,
  vscode-extensions,
  ...
}:

let
  extensions = vscode-extensions;
in
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) (
      lib.map lib.getName (
        with pkgs;
        [
          vscode
        ]
        ++ (with pkgs.vscode-extensions; [
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

    extensions =
      with extensions.vscode-marketplace;
      with pkgs.vscode-extensions;
      [
        # Graphical extensions
        jdinhlife.gruvbox
        sdras.night-owl
        teabyii.ayu
        sveggiani.vscode-field-lights

        # Utility extensions
        ms-vscode-remote.remote-ssh
        vscode-icons-team.vscode-icons
        eamodio.gitlens
        # ms-azuretools.vscode-docker
        # ms-vscode-remote.remote-containers
        adpyke.codesnap
        iliazeus.vscode-ansi
        vadimcn.vscode-lldb
        # ms-vscode.live-server

        # Code language extensions
        ms-vscode.cpptools
        xaver.clang-format
        ms-vscode.cmake-tools
        # twxs.cmake
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
    userSettings = builtins.fromJSON ''
      {
        "[dart]": {
          "editor.formatOnSave": true,
          "editor.formatOnType": false,
          "editor.rulers": [
            80
          ],
          "editor.selectionHighlight": false,
          "editor.tabCompletion": "onlySnippets",
          "editor.wordBasedSuggestions": "off"
        },
        "codesnap.realLineNumbers": false,
        "codesnap.roundedCorners": true,
        "codesnap.showLineNumbers": true,
        "codesnap.showWindowControls": false,
        "codesnap.showWindowTitle": true,
        "codesnap.shutterAction": "copy",
        "codesnap.target": "container",
        "codesnap.transparentBackground": true,
        "editor.formatOnSave": true,
        "editor.hover.delay": 450,
        "files.autoSave": "onFocusChange",
        "terminal.integrated.defaultLocation": "view",
        "terminal.integrated.fontFamily": "MartianMono Nerd Font",
        "terminal.integrated.fontSize": 14,
        "terminal.integrated.profiles.linux": {
          "bash": {
            "icon": "terminal-bash",
            "path": "~/.bashrc"
          }
        },
        "terminal.integrated.shellIntegration.enabled": false,
        "terminal.integrated.tabs.focusMode": "singleClick",
        "workbench.colorTheme": "Ayu Mirage Bordered",
        "workbench.iconTheme": "vscode-icons",
        "nix.enableLanguageServer": true,
        "nix.serverPath": "nixd",
        "nix.hiddenLanguageServerErrors" : [
          "textDocument/definition"
        ],
        "nix.serverSettings": {
          "nixd": {
            "formatting": {
              "command": [ "nixfmt" ]
            },
            "options": {
              "nixos": {
                "expr": "(builtins.getFlake \"/home/cbaziret/nixos/system-wide\").nixosConfigurations.default.options"
              },
              "home-manager": {
                "expr": "(builtins.getFlake \"/home/cbaziret/nixos/home-manager\").homeConfigurations.\"cbaziret\".options"
              }
            }
          }
        }
      }'';
  };

}
