{pkgs, ...}: {
  services.betterlockscreen = {
    enable = true;
    package = pkgs.unstable.betterlockscreen;
  };
}
