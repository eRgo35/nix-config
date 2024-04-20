{
  lib, 
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-calc
    ];
    location = "center";
    theme = "gruvbox-dark-soft";
  };
}
