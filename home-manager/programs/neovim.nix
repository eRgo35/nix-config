{
  inputs,
  pkgs,
  ...
}: {
  # programs.neovim = {
  #   enable = true;
  #   # package = pkgs.neovim;

  #   # viAlias = true;
  #   # vimAlias = true;
  #   # vimdiffAlias = true;

  #   # defaultEditor = true;
  # };

  home.packages = with pkgs; [
    neovim
  ];
}
