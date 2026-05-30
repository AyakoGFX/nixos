{ config, pkgs, ... }:

{
  programs.dconf.enable = true;

  users.users.ayako.extraGroups = [
    "libvirtd"
    "kvm"
    "qemu"
    "audio"
  ];

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    qemu
    qemu_kvm
    libvirt
    bridge-utils
    OVMF
    adwaita-icon-theme
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };

    spiceUSBRedirection.enable = true;
  };

  hardware.graphics.enable = true;
  services.spice-vdagentd.enable = true;
}
