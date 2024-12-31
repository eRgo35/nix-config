{pkgs, ...}: {
  home.packages = with pkgs; [
    neovide
  ];

  home.file = {
    ".config/neovide/config.toml" = {
      text = ''
        vsync = true

        [font]
        normal = ["FiraCode Nerd Font"]
        size = 14
      '';
    };
  };
}
