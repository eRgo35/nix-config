{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  networking.networkmanager.wifi.backend = "iwd";

  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        EnableNetworkConfiguration = true;
        UseDefaultInterface = true;
      };
      Settings = {
        AutoConnect = true;
      };
    };
  };

  # system.activationScripts = {
  #   rfkillUnblockWlan = {
  #     text = ''
  #     rfkill unblock wlan
  #     '';
  #     deps = [];
  #   };
  # };
}
