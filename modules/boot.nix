{ config, pkgs, lib, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  # Load the v4l2loopback module at boot
  boot.kernelModules = [ "v4l2loopback" ];

  # Make sure the module is available by building it with the correct kernel
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback.out
  ];
}

