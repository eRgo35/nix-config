{
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
}
