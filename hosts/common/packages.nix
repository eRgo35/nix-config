{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = (with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # wget
    ntfs3g
    dosfstools
    unstable.nh
    nix-output-monitor
    nvd
  ]);

  fonts.packages = with pkgs; [ nerdfonts ];
}
