{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    # enableSshSupport = true;
  };

  # programs.ssh = {
  #   startAgent = true;
  #   # agentTimeout = "1h";
  #   extraConfig = ''
  #     AddKeysToAgent yes
  #     IdentityFile ~/.ssh/senpai_ed25519;
  #   '';
  # };
}
