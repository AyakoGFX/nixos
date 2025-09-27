{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # beyond-all-reason # real-time strategy game
    openttd # simulation game based upon Transport Tycoon Deluxe
    # openra # real-time strategy game engine for early Westwood games such as Command & Conquer
    # xonotic # fast-paced first-person shooter
    # mindustry-wayland # Sandbox tower defense game. for non wayland (mindustry)
    # gzdoom # Modder-friendly OpenGL and Vulkan source port based on the DOOM engine
    # warzone2100 # Free RTS game, originally developed by Pumpkin Studios
  ];
}
