{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    ntfs3g
    dosfstools
    nix-output-monitor
    nvd
    brightnessctl
  ];

  programs.nix-ld.enable = true;

  services.zerotierone = {
    enable = true;
  };

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;

    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    settings = {
      max-cache-ttl = 60480000;
      default-cache-ttl = 60480000;
      # default-cache-ttl-ssh = 60480000;
      # max-cache-ttl-ssl = 60480000;
    };
  };

}
