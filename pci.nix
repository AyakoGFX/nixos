# boot.kernelParams = [ "amd_iommu=on" ]
  # 1002:73ff,1002:ab28
let
  # RTX 3070 Ti
  gpuIDs = [
    "1002:73ff" # Graphics
    "1002:ab28" # Audio
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
        "amdgpu"

        # "nvidia"
        # "nvidia_modeset"
        # "nvidia_uvm"
        # "nvidia_drm"
      ];

      kernelParams = [
        # enable IOMMU
        "amd_iommu=on"
      ] ++ lib.optional cfg.enable
        # isolate the GPU
        ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs);
    };

    # hardware.opengl.enable = true;
    # virtualisation.spiceUSBRedirection.enable = true;
  };
}
