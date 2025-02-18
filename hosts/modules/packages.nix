{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    ntfs3g
    dosfstools
    nix-output-monitor
    nvd
    brightnessctl
    piper
    alsa-utils
    wine
  ];

  programs.nix-ld.enable = true;

  services.ratbagd.enable = true;

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

  # fonts.packages = with pkgs; [
  #   nerd-fonts.zed-mono
  #   # nerd-fonts.victor-mono
  #   # nerd-fonts.ubuntu-sans
  #   # nerd-fonts.ubuntu-mono
  #   nerd-fonts.ubuntu
  #   # nerd-fonts.tinos
  #   # nerd-fonts.terminess-ttf
  #   nerd-fonts.symbols-only
  #   # nerd-fonts.space-mono
  #   # nerd-fonts.shure-tech-mono
  #   nerd-fonts.sauce-code-pro
  #   nerd-fonts.roboto-mono
  #   # nerd-fonts.recursive-mono
  #   # nerd-fonts.proggy-clean-tt
  #   # nerd-fonts.profont
  #   # nerd-fonts.overpass
  #   nerd-fonts.open-dyslexic
  #   nerd-fonts.noto
  #   # nerd-fonts.mplus
  #   # nerd-fonts.mononoki
  #   # nerd-fonts.monoid
  #   # nerd-fonts.monofur
  #   # nerd-fonts.monaspace
  #   # nerd-fonts.meslo-lg
  #   # nerd-fonts.martian-mono
  #   # nerd-fonts.lilex
  #   nerd-fonts.liberation
  #   # nerd-fonts.lekton
  #   nerd-fonts.jetbrains-mono
  #   # nerd-fonts.iosevka-term-slab
  #   # nerd-fonts.iosevka-term
  #   nerd-fonts.iosevka
  #   # nerd-fonts.intone-mono
  #   # nerd-fonts.inconsolata-lgc
  #   # nerd-fonts.inconsolata-go
  #   nerd-fonts.inconsolata
  #   # nerd-fonts.im-writing
  #   # nerd-fonts.hurmit
  #   # nerd-fonts.heavy-data
  #   # nerd-fonts.hasklug
  #   nerd-fonts.hack
  #   nerd-fonts.gohufont
  #   # nerd-fonts.go-mono
  #   # nerd-fonts.geist-mono
  #   nerd-fonts.fira-mono
  #   nerd-fonts.fira-code
  #   # nerd-fonts.fantasque-sans-mono
  #   # nerd-fonts.envy-code-r
  #   nerd-fonts.droid-sans-mono
  #   # nerd-fonts.departure-mono
  #   nerd-fonts.dejavu-sans-mono
  #   # nerd-fonts.daddy-time-mono
  #   # nerd-fonts.d2coding
  #   # nerd-fonts.cousine
  #   # nerd-fonts.commit-mono
  #   nerd-fonts.comic-shanns-mono
  #   nerd-fonts.code-new-roman
  #   nerd-fonts.caskaydia-cove
  #   # nerd-fonts.blex-mono
  #   # nerd-fonts.bitstream-vera-sans-mono
  #   # nerd-fonts.bigblue-terminal
  #   # nerd-fonts.aurulent-sans-mono
  #   # nerd-fonts.arimo
  #   # nerd-fonts.anonymice
  #   # nerd-fonts.agave
  #   nerd-fonts._3270
  #   nerd-fonts._0xproto
  #   noto-fonts
  #   noto-fonts-cjk-sans
  #   noto-fonts-emoji
  #   font-awesome
  #   source-han-sans
  #   source-han-sans-japanese
  #   source-han-serif-japanese
  # ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
    vistafonts
    corefonts
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
