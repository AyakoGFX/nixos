{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    droidcam
    android-tools
  ];

  # Load the v4l2loopback module at boot
  boot.kernelModules = [ "v4l2loopback" "snd_aloop" ];

  # Make sure the module is available by building it with the correct kernel
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback.out
  ];
}
