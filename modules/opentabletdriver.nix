{
  pkgs,
  lib,
  config,
  ...
}: 
{
  hardware.opentabletdriver.enable = true;
  environment.systemPackages = with pkgs; [
  osu-lazer
  ];

}
