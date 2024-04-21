{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./git.nix
    ./zsh
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    killall
  ];
}
