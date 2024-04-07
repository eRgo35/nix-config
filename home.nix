{ config, pkgs, ... }:
let
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
    df="df -ahiT --total";
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
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mike";
  home.homeDirectory = "/home/mike";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-powerlevel10k
    thefuck

    kitty
    rofi
    git
    eza
    
    tuxpaint
    krita    

    # spotify
    vlc
    mpv
    yt-dlp
    obs-studio
    ffmpeg

    # discord
    telegram-desktop
    
    prismlauncher
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  #programs.neovim = {
  #  enable = true;
  #
  #  viAlias = true;
  #  vimAlias = true;
  #  vimdiffAlias = true;
  #
  #  defaultEditor = true;
  # };

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
      plugins = [ "git" "thefuck" ];
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
}
