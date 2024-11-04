{ hostname, ... }:
{
  imports =
    if hostname == "zion" then [
      ./zion.nix

      ./modules/nh.nix
      ./modules/boot.nix
      ./modules/users.nix
      ./modules/greetd.nix
      ./modules/fstrim.nix
      ./modules/nvidia.nix
      ./modules/network.nix
      ./modules/security.nix
      ./modules/pipewire.nix
      ./modules/gsettings.nix
      ./modules/bluetooth.nix
      ./modules/packages.nix
      # ./modules/lanzaboot.nix
      ./modules/configuration.nix
    ]
    else if hostname == "thor" then [
      ./thor.nix

      ./modules/nh.nix
      ./modules/tlp.nix
      ./modules/boot.nix
      ./modules/users.nix
      ./modules/greetd.nix
      ./modules/fstrim.nix
      ./modules/network.nix
      ./modules/security.nix
      ./modules/pipewire.nix
      ./modules/gsettings.nix
      ./modules/bluetooth.nix
      ./modules/lanzaboot.nix
      ./modules/configuration.nix
    ]
    else if hostname == "server" then [
      ./server.nix

      ./modules/nh.nix
      ./modules/tlp.nix
      ./modules/ssh.nix
      ./modules/boot.nix
      ./modules/users.nix
      ./modules/nvidia.nix
      ./modules/ollama.nix
      ./modules/fstrim.nix
      ./modules/system.nix
      ./modules/network.nix
      ./modules/configuration.nix
      #./modules/lanzaboot.nix
    ]
    else [ ];
}
