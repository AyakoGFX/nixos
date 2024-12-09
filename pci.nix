# https://astrid.tech/2022/09/22/0/nixos-gpu-vfio/
{
  pkgs,
  lib,
  config,
  ...
}:
{
  boot = {
    initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
    ];

    kernelParams = [
      # Enable IOMMU
      "amd_iommu=on"
      "iommu=pt"
      # Blacklist conflicting drivers
      "modprobe.blacklist=amdgpu,"
      # Bind GPU and HDMI audio to vfio-pci
      "vfio-pci.ids=1002:73ff,1002:ab28"
    ];
  };

  boot.blacklistedKernelModules = [
    "amdgpu"
  ];
}
