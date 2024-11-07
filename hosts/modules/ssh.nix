{
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
      UseDns = true;
    };
  };

  programs.ssh = {
    startAgent = true;
  };
}
