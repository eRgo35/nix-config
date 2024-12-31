{
  pkgs,
  username,
  ...
}: {
  users.users.${username}.packages = with pkgs; [heroic];
  hardware.steam-hardware.enable = true;

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };

    gamemode = {
      enable = true;
      enableRenice = true;
      settings = {};
    };

    gamescope = {
      enable = true;
      args = [
        "-w 2560 -h 1440"
        "-F nis"
        "f"
      ];
    };
  };
}
