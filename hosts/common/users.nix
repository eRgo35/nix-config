{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    mike = {
      isNormalUser = true;
      description = "Mike";
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfqPj+a2gmoUl3TuGSZxf0zRBabVWvXRrjLF7sFlqjMbfkx428F3L7C8OC3Z9XDT4ysbpgWcPuVKNtK5kkKGjSLHAgB2CgvD15K11Q+ag1+uyePaiOypZYJewvv1hhqU5IrVcxUbTsbREH/IsdQSlNSuyNFIr3oFnrff5iKEKEwEvSDeiqpqRh56pAkF6Kb15aYqZO7X9rbfoa8Sgj3VJXN0181lXMjXkNsYVa3gDmKv89C6qutg+KOpHlXgn4AfIRcCw8ik6OGBEfi/gUeb3SYpD+7undNLyloxCbGwHQ40IdoqPatyhTNS4jm9kb+Tno4hj0pbLHZSUdXgGaSfGx1W0MVVY0mm0Hu7EmYDBHUTfmPmPxnolWh8UH+XdkNPnwZfyZlyBcVVkVzog1ZCs1i9Y6oS1ZIbzuz+WxBPPDIHMRdmxv6+PMc5kZyrpuX1PgFb7Xt5cRNAL5/wywoi9Z45SS7qP9zNSb443UaaXzUatqnlawZ0GS0qXJh3ljwJ8= mike@odin"
      ];
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
