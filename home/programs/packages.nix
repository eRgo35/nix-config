{ pkgs, ... }:
{
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    # > graphics < #
    tuxpaint
    krita

    # > terminal < #
    kitty
    kitty-themes

    # > tools < #
    git
    wget
    eza
    yt-dlp
    ffmpeg
    texlive.combined.scheme-full
    fastfetch
    zoxide
    btop
    htop
    killall
    woeusb
    pavucontrol
    steam-run
    unzip
    openvpn
    wol
    direnv
    p7zip
    hoppscotch
    networkmanagerapplet
    protonvpn-cli_2
    python3
    pwvucontrol

    # > media < #
    spotify
    vlc
    mpv
    obs-studio
    okular

    # > desktop < #
    firefox
    telegram-desktop
    google-chrome
    evolution
    obsidian
    foliate
    helio-workstation
    keepassxc
    vesktop

    # > gaming < #
    prismlauncher
    classicube
    steam

    # > development < #
    podman
    podman-compose
    seahorse
    platformio
    iwgtk
    imv
    feh
    zed-editor
    zint
    zip
    unzip
    pavucontrol
    libreoffice
    qalculate-gtk
    file-roller
    vim
    nixfmt-rfc-style
    nemo
  ];
}
