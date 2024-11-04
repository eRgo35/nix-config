{ hostname, ... }:
{
  imports =
    if hostname == "zion" then
      [
        ./programs/git.nix
        ./programs/btop.nix
        # ./programs/yazi.nix
        # ./programs/foot.nix
        ./programs/shell.nix
        # ./programs/helix.nix
        # ./programs/zathura.nix
        ./programs/packages.nix
        # ./programs/vscodium.nix
        ./programs/vscode.nix
        ./programs/kitty.nix
        ./programs/fastfetch.nix

        ./system/tofi.nix
        ./system/wofi.nix
        ./system/dunst.nix
        ./system/stylix.nix
        ./system/waybar.nix
        ./system/wlsunset.nix
        ./system/hyprland.nix
      ]
    else if hostname == "server" then
      [
        ./programs/git.nix
        ./programs/btop.nix
        ./programs/yazi.nix
        ./programs/shell.nix
        ./programs/helix.nix
        ./programs/fastfetch.nix
      ]
    else [ ];
}
