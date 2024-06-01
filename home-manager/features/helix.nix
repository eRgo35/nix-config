{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox_dark_soft";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
  };
}
