{
  pkgs,
  lib,
  config,
  ...
}: 
{
  environment.systemPackages = with pkgs; [
    espeak
    # uv
  ];
}

  # git clone https://github.com/Zyphra/Zonos.git
  # cd Zonos/
  # docker compose up
  # python -m venv venv
  # source venv/bin/activate.fish
  # pip install -e .
