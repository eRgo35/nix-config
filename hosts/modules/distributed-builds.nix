{pkgs, ...}: {
  nix.distributedBuilds = true;
  nix.settings.builders-use-substitutes = true;

  nix.buildMachines = [
    {
      hostName = "192.168.0.10";
      sshUser = "remotebuild";
      sshKey = "/root/.ssh/remotebuild";
      system = "x86_64-linux";
      supportedFeatures = ["nixos-test" "big-parallel" "kvm"];
    }
  ];
}
