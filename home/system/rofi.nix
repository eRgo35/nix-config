{ lib, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    location = "center";
    theme = lib.mkForce ../configs/rose-pine.rasi;
  };
}
