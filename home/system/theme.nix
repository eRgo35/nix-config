{
  lib,
  pkgs,
  inputs,
  ...
}:
let

in
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
    };
  };

  xdg.configFile = {
    # "Kvantum/kvantum.kvconfig".text = ''
    #   [General]
    #   theme=GraphiteNordDark
    # '';

    # "Kvantum/GraphiteNord".source = "${pkgs.graphite-kde-theme}/share/Kvantum/GraphiteNord";

    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=rosepine-kvantum
    '';

    "Kvantum/rosepine-kvantum".source = "${
      inputs.rosepine-kvantum.packages.${pkgs.system}.default
    }/share/Kvantum/rosepine-kvantum";
    # "Kvantum/rosepine".source = ../configs/Kvantum/rosepine-kvantum;
  };
}
