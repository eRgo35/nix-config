{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    defaultEditor = true;
  };
}
