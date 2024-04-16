# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ 
  inputs,
  outputs,
  lib,
  config, 
  pkgs,
  ...
}: let
  myAliases = {
    ".." = "cd ..";
    "cd.." = "cd ..";
    
    ls = "command eza";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";

    l="eza -G --icons";
    ll="eza -l --icons";
    lg="eza -lG";
    lall="eza -lahF --icons --git";
    lalg="eza -laGhF --icons --git";
    latree="eza -laGghHT --git --icons";
    la = "eza -la --git --icons";
    lsd = "eza -laD";

    cls="clear";
    # df="df -ahiT --total";
    userlist="cut -d: -f1 /etc/passwd";
    free="free -mt";
    du="du -ach | sort -h";
    ps="ps auxf"; 

    sudo="sudo ";
    reload="exec $SHELL -l";

    xclip = "xclip -selection c";

    mkdir="mkdir -pv";
    psmem="ps -e -orss=,args= | sort -b -k1 -nr";
    psmem10="ps -e -orss=,args= | sort -b -k1 -nr | head -10";
    pscpu="ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr";
    pscpu10="ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr | head -10";

    gua = "git remote | xargs -L1 git push --all";
  };
in {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Username to manage
  home = {
    username = "mike";
    homeDirectory = "/home/mike";
    file = {
      # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = (with pkgs; [
    # > zsh stuff <
    zsh
    zsh-autosuggestions
    zsh-powerlevel10k

    # > graphics <
    tuxpaint
    krita    

    # > terminal <
    kitty
    kitty-themes

    # > tools <
    rofi 
    git
    wget
    eza
    yt-dlp
    ffmpeg
    # texliveFull
    texlive.combined.scheme-full
    pgf-umlcd
    pgf-umlsd
    zoxide
    neofetch
    pavucontrol
    htop
    woeusb
    steam-run
    unzip
    gnome.gnome-keyring
    gnome.adwaita-icon-theme

    # > media <
    spotify
    vlc
    mpv
    obs-studio

    # > desktop <
    firefox
    discord
    telegram-desktop
    libreoffice-fresh
    # vscodium
    vscode
    neovide
    lunarvim
    evolution
    rstudio
  
    # > gaming <
    prismlauncher
    classicube
    steam     

    # > development <
    clang
    clang-tools
    cargo
    bash
    nodejs
    python3
    cmake
    gtest
    boost
  ]);

  services.gnome-keyring.enable = true;
    
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };

    theme = "Gruvbox Dark";
    #Also available: Catppuccin-Frappe Catppuccin-Latte Catppuccin-Macchiato Catppuccin-Mocha
    # See all available kitty themes at: https://github.com/kovidgoyal/kitty-themes/blob/46d9dfe230f315a6a0c62f4687f6b3da20fd05e4/themes.json
  };

  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    defaultEditor = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history.size = 10000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases = myAliases;

    initExtra = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
      eval "$(zoxide init zsh)"
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      #  { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

  };

  programs.git = {
    enable = true; 
    userName = "Michał Czyż";
    userEmail = "mike@c2yz.com";
    signing = {
      key = "78D4829A477DAB25";
      signByDefault = true;
    };
    extraConfig = {
      push = {
        default = "simple";
      };
      rerere = {
        enable = true;
      };
      column = {
        ui = "auto";
      };
      branch = {
        sort = "-committerdate";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
