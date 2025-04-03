{ config, pkgs, lib, ... }:

let
  myEmacs = (pkgs.emacsPackagesFor pkgs.emacs-pgtk).emacsWithPackages (epkgs: with epkgs; [
    # vterm
    treesit-grammars.with-all-grammars
  ]);
in {
  environment.systemPackages = with pkgs; [
    myEmacs
    uemacs # bin name = em
    texliveFull
    zathura
    espeak
    # delta #Syntax-highlighting diff files git
    # emacs-lsp-booster
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


    #lsp-bridge
    # python312Packages.epc
    # python312Packages.orjson
    # python312Packages.sexpdata
    # python312Packages.six
    # python312Packages.setuptools
    # python312Packages.paramiko
    # python312Packages.rapidfuzz
    # python312Packages.watchdog
    # python312Packages.packaging
  ];
}

# Emacs with vterm
# ((pkgs.emacsPackagesFor pkgs.emacs30).emacsWithPackages (epkgs: [ epkgs.vterm ]))
