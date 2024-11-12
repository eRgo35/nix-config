{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

 #qt = {
 #  enable = false;
 #  style.name = "gtk2";
 #  platformTheme.name = "gtk";
 #};

  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
      gnome.enable = true;
      gtk.enable = true;
      # foot.enable = false;
      wofi.enable = false;
      # tofi.enable = false;
      vscode.enable = false;
      waybar.enable = false;
      hyprland.enable = false;
    };

    image = ../wallpapers/blockwavemoon.png;

    override = {
      base00 = "191724";
      base01 = "1f1d2e";
      base02 = "26233a";
      base03 = "6e6a86";
      base04 = "908caa";
      base05 = "e0def4";
      base06 = "e0def4";
      base07 = "524f67";
      base08 = "eb6f92";
      base09 = "f6c177";
      base0A = "ebbcba";
      base0B = "31748f";
      base0C = "9ccfd8";
      base0D = "c4a7e7";
      base0E = "f6c177";
      base0F = "524f67";
    };

    cursor = {
      size = 24;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    fonts = {
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "noto-fonts-color-emoji";
      };

      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; };
        name = "DroidSansMono";
      };

      sansSerif = {
        package = pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; };
        name = "DroidSansMono";
      };

      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; };
        name = "DroidSansMono";
      };
    };
  };
}
