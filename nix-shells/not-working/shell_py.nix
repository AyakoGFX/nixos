{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "python-env";

  buildInputs = [
    pkgs.python311          # Python 3.10 (adjust version as needed)
    pkgs.python311Packages.pip
    pkgs.python311Packages.virtualenv
    pkgs.python311Packages.manim
  ];

  shellHook = ''
    echo "Welcome to your Python development shell!"
  '';

  # Force Fish shell compatibility
  # Exports the correct environment for Fish
  # shellHookFish = pkgs.writeShellScript "hook-fish" ''
    # echo "This is designed for Fish."
  # '';
}
