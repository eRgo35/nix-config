{
  inputs,
  pkgs,
  ...
}: {
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  
  home.packages = with pkgs; [
    # > graphics < #
    tuxpaint
    # krita
    gimp

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
    httrack
    # whatsapp-for-linux
    telegram-desktop
    # google-chrome
    # chromium
    brave
    evolution
    obsidian
    foliate
    helio-workstation
    # vesktop
    equibop
    # inputs.zen-browser.packages."${system}".default
    papers
    

    # > gaming < #
    prismlauncher
    classicube

    # > development < #
    android-studio
    seahorse
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
    # nixfmt-rfc-style
    nemo
    nixd
    glfw-wayland-minecraft
  ];
}
