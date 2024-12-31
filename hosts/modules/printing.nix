{pkgs, ...}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      samsung-unified-linux-driver
      splix
    ];
  };
}
