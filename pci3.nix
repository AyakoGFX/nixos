{ config, pkgs, lib, ... }: 
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

      # Pass GPU and audio IDs to vfio-pci
      "vfio-pci.ids=1002:73ff,1002:ab28"

      # Blacklist conflicting drivers
      "modprobe.blacklist=amdgpu,snd_hda_intel"
    ];
  };

  boot.blacklistedKernelModules = [
    "amdgpu"
    "snd_hda_intel"
  ];
};
