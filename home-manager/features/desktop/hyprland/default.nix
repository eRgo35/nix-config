{
  lib,
  config,
  pkgs,
  ...
}: let
  hyprland = pkgs.inputs.hyprland.hyprland.override {wrapRuntimeDeps = false;};
  xdhp = pkgs.inputs.hyprland.xdg-desktop-portal-hyprland.override {inherit hyprland;};
in {
  imports = [
    ../common 
    ../common/wayland-wm
  ];

  xdg.portal = {
    extraPortals = [xdhp];
    configPackages = [hyprland];
  };

  home.packages = with pkgs; [
    inputs.hyprwm-contrib.grimblast
    hyprslurp
    hyprpicker
  ];

  wayland.windowManger.hyprland = {
    enable = true;
    package = hyprland;
    systemd = {
      enable = true;
      # Same as default but stop graphical-session too
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

#TODO: Add hyprland config
  };
}
