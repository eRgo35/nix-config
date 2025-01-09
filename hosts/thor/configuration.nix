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

    ../modules/adb.nix
    ../modules/ananicy.nix
    ../modules/bluetooth.nix
    ../modules/boot.nix
    ../modules/common.nix
    ../modules/development.nix
    ../modules/distributed-builds.nix
    ../modules/fstrim.nix
    ../modules/gaming.nix
    # ../modules/greetd.nix
    ../modules/gsettings.nix
    # ../modules/kde.nix
    # ../modules/lanzaboot.nix
    ../modules/network.nix
    ../modules/nh.nix
    # ../modules/nvidia.nix
    ../modules/ollama.nix
    ../modules/packages.nix
    ../modules/pipewire.nix
    ../modules/printing.nix
    # ../modules/remote-builder.nix
    ../modules/security.nix
    ../modules/ssh.nix
#  ../modules/steam.nix
    ../modules/tlp.nix
    ../modules/users.nix
    ../modules/vm.nix
    ../modules/xserver.nix
  ];

  networking.hostName = "thor";
}
