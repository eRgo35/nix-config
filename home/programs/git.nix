{
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
    };
  };
}
