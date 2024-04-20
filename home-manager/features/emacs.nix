{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.unstable.emacs;
  };
}
