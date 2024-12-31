{hostname, ...}: {
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "${hostname}";
    firewall.enable = true;

    stevenblack = {
      enable = true;
      block = ["fakenews" "gambling" "porn"];
    };

    wireless = {
      enable = false;
      iwd.enable = false;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };
  };
}
