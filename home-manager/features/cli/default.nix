{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./git.nix
    ./zsh
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    killall
    comma
    distrobox
    bc
    bottom
    ncdu
    tly
    ltex-ls 
    nil
    alejandra 
    timer
    jq
    diffsitter
  ];
}
