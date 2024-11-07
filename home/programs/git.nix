{ pkgs, config, ... }: {
  programs.git = {
    enable = true;

    userName = "Michał Czyż";
    userEmail = "mike@c2yz.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      user.signingkey = "9745B9E27E2B1ABB";
      commit.gpgsign = true;
      push.enabled = true;
      column.ui = "auto";
      branch.sort = "-committerdate";
      pull.rebase = "false";
      rerere.enabled = true;
      # gpg = {
      #   format = "ssh";
      #   ssh.defaultKeyCommand = pkgs.writeShellScript "git_key" ''
      #     if ssh-add -L | grep -vq '${config.local.keys.senpai}'; then
      #       ssh-add -t 1m ~/.ssh/id_ed25519
      #     fi
      #     echo 'key::${config.local.keys.senpai}'
      #   '';
      # };
      push.gpgsign = "if-asked";
    };
  };

}
