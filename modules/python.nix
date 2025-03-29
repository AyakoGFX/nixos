{
  pkgs,
  lib,
  config,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    # python310          # Python 3.10 (adjust version as needed)
    # python310Packages.pip
    # python310Packages.virtualenv
    pipx
    pip3
    python313
    python313Packages.pip
    virtualenv
  ];
}
