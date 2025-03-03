{ config, pkgs, lib, ... }:

{
  users = {
    users.ayako = {
      isNormalUser = true;
      description = "ayako";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "adbusers"
        "docker"
      ];
      packages = with pkgs; [ ];
    };
    defaultUserShell = pkgs.fish;
  };
}
