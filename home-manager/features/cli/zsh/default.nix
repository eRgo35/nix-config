{
  config,
  pkgs,
  ...
}: let
  cli = import ../aliases.nix;
in {
  home.packages = with pkgs; [
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history.size = 10000000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases = cli.myAliases;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    enableAutosuggestions = true;

    syntaxHighlighting = {
      enable = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    initExtra = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
      eval "$(zoxide init --cmd cd zsh)"
      if [ -x "$(command -v tmux)" ] && [ -n "$DISPLAY" ] && [ -z "$TMUX" ]; then
        # exec tmux new-session -A -s $USER >/dev/null 2>&1
        exec tmux new -AD -t main -s main
      fi
    '';
  };
}
