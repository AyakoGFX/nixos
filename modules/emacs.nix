{ config, pkgs, lib, ... }:

let
  myEmacs = (pkgs.emacsPackagesFor pkgs.emacs-pgtk).emacsWithPackages (epkgs: with epkgs; [
    # vterm
    treesit-grammars.with-all-grammars
  ]);
in {
  environment.systemPackages = with pkgs; [
    myEmacs
    texliveFull
    zathura
    espeak
    # ghostscript # doc view mode Emacs

    # nixfmt-rfc-style
    # nil
    clang-tools

    # Go Lang Configuration
    go
    gopls
    typescript-language-server

    # Python Lang Configuration
    python312Packages.python-lsp-server
    python312Packages.black

    # <spell checking>
    hunspell
    hunspellDicts.en-us-large
    tree-sitter
    harper # not working
    # emacsPackages.jinx
    # <end>
    exiftool # for hacker-man.el

  ];
}

# Emacs with vterm
# ((pkgs.emacsPackagesFor pkgs.emacs30).emacsWithPackages (epkgs: [ epkgs.vterm ]))
