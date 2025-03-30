{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3Full  # Full Python with Tk support
    pkgs.tk           # Tkinter dependency
  ];
}
