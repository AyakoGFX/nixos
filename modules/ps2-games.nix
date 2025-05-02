{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    pcsx2 
  ];
}
# https://www.reddit.com/r/EmulationOnPC/comments/1aj96mp/how_to_download_a_pcsx2_bios_properly/
# https://youtu.be/7Q0gy0s8Mxo?si=D1DFS4_4CZ-lvFMu
# https://mega.nz/file/CZtzib7K#kQBwcq-zavhR7mLa-3OJPBvdWVmmmR1p7tgWhKjluE4

