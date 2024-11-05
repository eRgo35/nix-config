{
  security = {
    sudo.enable = true;
    rtkit.enable = true;
    polkit.enable = true;
  };

  services = {
    gnome.gnome-keyring.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
  };
}
