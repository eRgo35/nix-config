{hostname, ...}: {
  imports =
    if hostname == "zion"
    then [
      ./zion.nix

      ./modules/adb.nix
      ./modules/ananicy.nix
      # ./modules/bluetooth.nix
      ./modules/boot.nix
      ./modules/configuration.nix
      ./modules/development.nix
      ./modules/fstrim.nix
      ./modules/gaming.nix
      # ./modules/greetd.nix
      ./modules/gsettings.nix
      # ./modules/kde.nix
      # ./modules/lanzaboot.nix
      ./modules/network.nix
      ./modules/nh.nix
      ./modules/nvidia.nix
      ./modules/ollama.nix
      ./modules/packages.nix
      ./modules/pipewire.nix
      ./modules/printing.nix
      ./modules/remote-builder.nix
      ./modules/security.nix
      ./modules/ssh.nix
      ./modules/steam.nix
      ./modules/users.nix
      ./modules/vm.nix
      ./modules/xserver.nix
    ]
    else if hostname == "thor"
    then [
      ./thor.nix

      ./modules/adb.nix
      ./modules/ananicy.nix
      ./modules/bluetooth.nix
      ./modules/boot.nix
      ./modules/configuration.nix
      ./modules/development.nix
      ./modules/distributed-builds.nix
      ./modules/fstrim.nix
      ./modules/gaming.nix
      ./modules/greetd.nix
      ./modules/gsettings.nix
      # ./modules/kde.nix
      # ./modules/lanzaboot.nix
      ./modules/network.nix
      ./modules/nh.nix
      # ./modules/nvidia.nix
      ./modules/ollama.nix
      ./modules/packages.nix
      ./modules/pipewire.nix
      ./modules/printing.nix
      ./modules/security.nix
      ./modules/ssh.nix
      ./modules/tlp.nix
      ./modules/users.nix
      ./modules/vm.nix
    ]
    else if hostname == "server"
    then [
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
    else [];
}
