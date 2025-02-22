{ config, pkgs, lib, ... }:

{
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  services.xserver.displayManager.sessionCommands = ''
    xset -dpms
    xset s noblank
    xset s 3600
    ${pkgs.lightlocker}/bin/light-locker --idle-hint &
  '';
}
