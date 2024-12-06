let
  # Vega GPU and associated devices
  gpuIDs = [
    "1002:1638" # Vega GPU
    "1002:1637" # Vega Audio
  ];
in { pkgs, lib, config, ... }: {
  options.vfio.enable = with lib;
    mkEnableOption "Configure the machine for VFIO";

  config = let cfg = config.vfio;
  in {
    boot = {
      initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        # Uncomment "amdgpu" only if you're NOT blacklisting it
        # "amdgpu"
      ];

      kernelParams = [
        # Enable IOMMU
        "amd_iommu=on"
        # Helps prevent screen tearing and other issues
        "iommu=pt"
      ] ++ lib.optional cfg.enable
        # Isolate the GPU using dynamic IDs
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    # Uncomment if you plan to use the GPU for the host
    # hardware.opengl.enable = true;

    # Optional virtualization settings
    # virtualisation.spiceUSBRedirection.enable = true;

    boot.blacklistedKernelModules = [ "amdgpu" ];

    # Uncomment to blacklist specific kernel modules
    # boot.blacklistedKernelModules = [
    #   "amdgpu"
    #   "snd_hda_intel"
    # ];   
  };
}
  boot.initrd.kernelModules = [ "vfio_pci" ]
