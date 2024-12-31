{pkgs, ...}: let
  cli = import ../configs/aliases.nix;
in {
  programs = {
    zoxide.enable = true;

    eza = {
      enable = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "--header"
        "--icons"
      ];
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };

    zellij = {
      enable = true;
      settings = {
        ui = {
          pane_frames.hide_session_name = true;
          pane_borderless = true;
        };
      };
    };

    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = cli.myAliases;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      history.size = 10000000;

      shellAliases = cli.myAliases;

      # plugins = [
      #   {
      #     name = "powerlevel10k";
      #     src = pkgs.zsh-powerlevel10k;
      #     file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      #   }
      # ];

      autosuggestion = {
        enable = true;
      };

      syntaxHighlighting = {
        enable = true;
      };

      historySubstringSearch = {
        enable = true;
      };

      initExtra = ''
        eval "$(zoxide init --cmd cd zsh)"
      '';
    };
  };
}
