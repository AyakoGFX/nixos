# https://nixos.wiki/wiki/Python
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Build inputs for the development environment
  buildInputs = [
    pkgs.python3  # Use Python 3
    pkgs.gcc      # Include GCC for libstdc++
    pkgs.python3Packages.pip      # Pip for package management
    pkgs.python3Packages.virtualenv # Virtualenv for isolated environments
    pkgs.ffmpeg   # Optional: For video/audio processing
    pkgs.cairo    # Required for rendering
    pkgs.pango    # Text layout and rendering
    pkgs.freetype # Font rendering
    pkgs.glib     # Core library
    pkgs.harfbuzz # Text shaping
    pkgs.fontconfig # Font management
    pkgs.pkg-config # Managing library paths
  ];

  # Shell hook to run commands when entering the shell
  shellHook = ''
    # Create a virtual environment if it doesn't exist
    if [ ! -d ".venv" ]; then
      virtualenv .venv
      .venv/bin/pip install manim
    fi
    
    # Set library path for libstdc++
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
    
    # Activate the virtual environment
    source .venv/bin/activate
  '';
}














#from manim import *
#
#class HelloScene(Scene):
#    def construct(self):
#        text = Text("Hello, Manim!")
#        self.play(Write(text))
#        self.wait(2)


# manim -pql example.py HelloScene

# -pql: Quick low-quality preview

# -pqh: High-quality preview
