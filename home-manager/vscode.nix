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
          ms-dotnettools.vscode-dotnet-runtime
          ms-dotnettools.csharp
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
        visualstudiotoolsforunity.vstuc
        ms-dotnettools.vscode-dotnet-runtime
        ms-dotnettools.csharp
        # llvm-vs-code-extensions.vscode-clangd

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
      {
        key = "ctrl+e";
        command = "-workbench.action.quickOpen";
        when = null;
      }
      {
        key = "ctrl+e";
        command = "workbench.files.action.showActiveFileInExplorer";
        when = "editorFocus";
      }

    ];
    userSettings = builtins.fromJSON ''
      {
        "window.titleBarStyle": "custom",
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
        "terminal.integrated.fontSize": 13,
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
        "editor.fontFamily": "MartianMono Nerd Font",
        "editor.fontSize": 13,
        "nix.hiddenLanguageServerErrors" : [
          "textDocument/definition"
        ],
        "nix.enableLanguageServer": true,
        "nix.serverPath": "nixd",
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
        },
        "workbench.colorCustomizations": {
          "minimap.background": "#24293655"
        },
        "explorer.autoReveal": false
      }'';
  };
  # "editor.background": "#212733FF"
  # "editor.fontFamily": "'Droid Sans Mono', 'monospace', monospace "
}
