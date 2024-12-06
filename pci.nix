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
        # "vfio_virqfd"
        # Uncomment "amdgpu" only if you're NOT blacklisting it
        # "amdgpu"
      ];

      kernelParams = [
        # Enable IOMMU
        "amd_iommu=on"
       # Helps prevent screentearing and other issues.
        "iommu=pt"
      ] ++ lib.optional cfg.enable
        # Isolate the GPU
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    # Uncomment this if using GPU for the host
    # hardware.opengl.enable = true;

    # Optional virtualization settings
   # virtualisation.spiceUSBRedirection.enable = true;

  # boot.blacklistedKernelModules = [
    # "amdgpu"
    # "snd_hda_intel"
  # ];   

  };
}
