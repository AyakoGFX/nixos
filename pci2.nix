{ config, pkgs, ... }:

{
  # boot.initrd.kernelModules = [ "vfio_pci" ];
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
    "vfio-pci.ids=1002:1638,1002:1637"
  ];
}
# cat /proc/cmdline
