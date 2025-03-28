# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    ../modules/common.nix

    ../modules/nh.nix
    ../modules/tlp.nix
    ../modules/ssh.nix
    ../modules/boot.nix
    ../modules/users.nix
    ../modules/nvidia.nix
    ../modules/ollama.nix
    ../modules/fstrim.nix
    ../modules/system.nix
    ../modules/network.nix
    ../modules/configuration.nix
    #../modules/lanzaboot.nix
  ];

  networking.hostName = "server";
}
