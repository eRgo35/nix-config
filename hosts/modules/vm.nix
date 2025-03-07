{pkgs, ...}: {
  boot.kernel.sysctl = {"vm.max_map_count" = 2147483642;};

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    distrobox
    nvidia-container-toolkit
  ];

  services.spice-vdagentd.enable = true;

  virtualisation = {
    docker = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };
}
