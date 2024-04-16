{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./git.nix
    ./zsh.nix
  ];
  # home.packages = with pkgs; [];
}
