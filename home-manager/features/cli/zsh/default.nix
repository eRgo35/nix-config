{config, pkgs, ...}: let 
  cli = import ../aliases.nix; 
in {
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-prezto
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history.size = 10000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases = cli.myAliases;
    
    syntaxHighlighting = {
      enable = true;
    };

    initExtra = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
      eval "$(zoxide init --cmd cd zsh)"
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    # plug = {
    #   enable = true;
    #   plugins = [
    #     { name = "zsh-users/zsh-autosuggestions"; }
    #   ];
    # };

    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "vi-mode" ];
    # };
    # 
    # prezto = {
    #   enable = true;
    #   tmux = {
    #     autoStartLocal = true;
    #     autoStartRemote = true;
    #   };
    # };
  };
}
