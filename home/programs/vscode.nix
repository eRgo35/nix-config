{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      jnoortheen.nix-ide
      mvllow.rose-pine
    ];

    userSettings = {

      "editor.fontSize" = 18;
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = true;
      "git.openRepositoryInParentFolders" = "never";

      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
      };

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
          };
          "nixpkgs" = {
            "expr" = "import <nixpkgs> { }";
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"/home/mike/.files\").nixosConfigurations.zion.options";
              };
            };
          };
        };
      };

      "editor.formatOnSave" = true;

      "editor.fontLigatures" = true;
      "editor.formatOnPaste" = true;
      "editor.minimap.enabled" = false;

      "symbols.hidesExplorerArrows" = false;

      "workbench.iconTheme" = "vs-minimal";
      "workbench.colorTheme" = "Rose Pine";
      "workbench.preferredDarkColorTheme" = "Rose Pine";
      "workbench.preferredHighContrastColorTheme" = "Rose Pine";

    };
  };
}
