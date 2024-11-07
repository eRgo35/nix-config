{ hostname, ... }:
{
  imports =
    if hostname == "zion" then
      [
        ./programs/btop.nix
        ./programs/fastfetch.nix
        # ./programs/foot.nix
        ./programs/git.nix
        ./programs/gpg.nix
        ./programs/helix.nix
        ./programs/kitty.nix
        ./programs/neovide.nix
        ./programs/neovim.nix
        ./programs/packages.nix
        ./programs/shell.nix
        ./programs/tmux.nix
        ./programs/vscodium.nix
        # ./programs/yazi.nix
        # ./programs/zathura.nix

        # ./configs/keys.nix

        ./system/dunst.nix
        ./system/hyprland.nix
        ./system/rofi.nix
        ./system/stylix.nix
        ./system/waybar.nix
        ./system/wlsunset.nix
        ./system/wofi.nix
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
