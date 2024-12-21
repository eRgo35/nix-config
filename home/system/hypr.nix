{ lib, pkgs, inputs, hostname, ... }:
{
  home.packages = with pkgs; [
    hypr
  ];
}
