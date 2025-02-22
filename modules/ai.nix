{
  pkgs,
  lib,
  config,
  ...
}: 
{
  services.ollama = {
    enable = true;
    acceleration = "rocm"; # Enable ROCm acceleration for AMD GPUs
    # Optional: Specify models to load on startup
    # loadModels = [ "deepseek-r1:8b" ]; 
  };
  services.open-webui.enable = true;
}

  # open-webui
  # http://localhost:11434/
  # http://localhost:8080/

