{
  lib, 
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
     rofi
     dmenu
     st
  ];
}
