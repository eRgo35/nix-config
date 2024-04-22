let
  cli = import ./aliases.nix;
in {
  programs.bash = {
    enable = true;
    shellAliases = cli.myAliases;
  };
}
