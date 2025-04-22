{ config, pkgs, lib, ... }:

{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };
  environment.systemPackages = with pkgs; [
    qjackctl  # Qt application to control the JACK sound server daemon
    qpwgraph  # Qt graph manager for PipeWire, similar to QjackCtl
  ];
}

  

