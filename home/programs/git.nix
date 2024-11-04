{
  programs.git = {
    enable = true;

    userName = "Michał Czyż";
    userEmail = "mike@c2yz.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
