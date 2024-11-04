{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    xkb.variant = "";
    excludePackages = [ pkgs.xterm ];
  };
}
