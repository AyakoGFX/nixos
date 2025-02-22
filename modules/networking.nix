{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
}
