{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./git.nix
    ./zsh
  ];
  home.packages = with pkgs; [
    killall
  ];
}
