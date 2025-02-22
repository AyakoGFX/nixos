{ config, pkgs, lib, ... }:
{
  security = {
    polkit.enable = true;
    pam.services.lightdm.enableGnomeKeyring = true;
  };
}
