{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    libgcc
    gnumake
    cmake
    extra-cmake-modules

    python3
    python3Packages.pip
    python3Packages.virtualenv
    pkg-config
    pango
    cairo
  ];
}

# nix-shell
# virtualenv .venv
# source .venv/bin/activate
# pip install manim


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
