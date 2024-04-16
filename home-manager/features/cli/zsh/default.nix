{config, pkgs, ...}: let 
  cli = import ../aliases.nix; 
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history.size = 10000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases = cli.myAliases;

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
}
