{ username, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/.files";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 3";
    };
  };
}
