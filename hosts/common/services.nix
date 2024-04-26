{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # I use zsh btw
  environment.shells = with pkgs; [bash zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;


  # Configure console keymap
  console.keyMap = "pl2";
  
  # services.gnome.gnome-keyring.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
    settings = {
      max-cache-ttl = 60480000;
      default-cache-ttl = 60480000;
      # default-cache-ttl-ssh = 60480000;
      # max-cache-ttl-ssl = 60480000;
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = true;
    };
  };

  # security.pam.services.kwallet = {
  #   name = "kwallet";
  #   enableKwallet = true;
  # };

  programs.ssh = {
    # startAgent = true;
    forwardX11 = true;
    # enableAskPassword = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
