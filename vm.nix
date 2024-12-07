{ config, pkgs, ... }:
{

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  users.users.ayako.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    qemu
    qemu_kvm
    libvirt
    bridge-utils
    OVMF
    pkgs.adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  hardware.graphics.enable = true;
  services.spice-vdagentd.enable = true;
}



  # Old Way Of Doing #
  #  Virtualization By Virt-Manager
  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;
  # virtualisation.spiceUSBRedirection.enable = true;
