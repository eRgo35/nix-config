{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      ps:
        with ps; [
          rustup
          zlib
          openssl.dev
          pkg-config
          # nixfmt-rfc-style
          python3
        ]
    );

    # extensions = with pkgs.vscode-extensions; [
    #   ms-python.python
    #   ms-python.debugpy
    #   jnoortheen.nix-ide
    #   mkhl.direnv
    #   arrterian.nix-env-selector
    #   mvllow.rose-pine
    #   github.copilot
    #   # github.copilot-chat
    #   ms-vsliveshare.vsliveshare
    #   rust-lang.rust-analyzer
    # ];
    #
    # userSettings = {
    #   "editor.fontSize" = 16;
    #   "editor.fontFamily" = "FiraCode Nerd Font";
    #   "explorer.confirmDelete" = false;
    #   "disable-hardware-acceleration" = true;
    #   "explorer.confirmDragAndDrop" = true;
    #   "git.openRepositoryInParentFolders" = "never";
    #
    #   "[python]" = {
    #     "editor.defaultFormatter" = "ms-python.black-formatter";
    #     "editor.formatOnSave" = true;
    #   };
    #
    #   "nix.enableLanguageServer" = true;
    #   "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
    #   "nix.serverSettings" = {
    #     "nixd" = {
    #       "formatting" = {
    #         "command" = ["${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"];
    #       };
    #       "nixpkgs" = {
    #         "expr" = "import <nixpkgs> { }";
    #         "options" = {
    #           "nixos" = {
    #             "expr" = ''(builtins.getFlake "/home/mike/.files").nixosConfigurations.zion.options'';
    #           };
    #         };
    #       };
    #     };
    #   };
    #
    #   "editor.formatOnSave" = true;
    #
    #   "editor.fontLigatures" = true;
    #   "editor.formatOnPaste" = true;
    #   "editor.minimap.enabled" = false;
    #
    #   # "symbols.hidesExplorerArrows" = false;
    #
    #   "workbench.iconTheme" = "rose-pine-icons";
    #   "workbench.colorTheme" = "Rosé Pine";
    #   "workbench.preferredDarkColorTheme" = "Rosé Pine";
    #   "workbench.preferredHighContrastColorTheme" = "Rosé Pine";
    # };
  };
}
