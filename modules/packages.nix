{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config = {
    permittedInsecurePackages = [
      "qbittorrent-4.6.4"
      "archiver-3.5.1"
    ];
  };
  environment.systemPackages = with pkgs; [
    ###############################################
    #           TEXT EDITORS                      #
    ###############################################
    vim
    neovim
    #code-cursor
    helix
    micro
    tree
    ((pkgs.emacsPackagesFor pkgs.emacs30).emacsWithPackages (epkgs: [ epkgs.vterm ]))
    emacsPackages.jinx
    #*latex*
    texliveFull
    zathura
    # ghostscript # doc view mode enacs

    # aspell
    hunspell
    hunspellDicts.en-us-large
    nixfmt-rfc-style
    nil
    libsForQt5.kdenlive
    audacity
    blanket

    
    ###############################################
    #        DEVELOPMENT & BUILD TOOLS            #
    ###############################################
    gcc
    cmake
    git
    bison
    flex
    fontforge
    makeWrapper
    pkg-config
    gnumake
    libiconv
    autoconf
    automake
    libtool

    ###############################################
    #          SYSTEM UTILITIES                   #
    ###############################################
    wget
    fish
    tldr
    xorg.xkill
    termdown
    gdu
    zip
    unrar
    rar
    unzip
    findutils
    os-prober
    ntfs3g
    stow
    acpi
    appimage-run
    ripgrep
    pciutils

    ###############################################
    #    DESKTOP ENVIRONMENT & WINDOW MANAGER     #
    ###############################################

    cava
    gnome-font-viewer

    
    ###############################################
    #         AUDIO & VIDEO TOOLS                 #
    ###############################################
    vlc
    # davinci-resolve
    ffmpeg
   # handbrake
    pulseaudioFull
    pavucontrol
    obs-studio

    ###############################################
    #      INTERNET & COMMUNICATION               #
    ###############################################
    qbittorrent
    discord
    # telegram-desktop
    # google-chrome
    # freetube
  #  thunderbird
  #  protontricks

    ###############################################
    #      FILE MANAGEMENT & ARCHIVES             #
    ###############################################
 #   xarchiver
    file-roller
    gparted

    ###############################################
    #          MEDIA & GRAPHICS                   #
    ###############################################
    yt-dlp
    cmus
    mpv
    #gimp
    # inkscape-with-extensions

    ###############################################
    #        SHELL ENHANCEMENTS                   #
    ###############################################
    zoxide
    eza
    trash-cli
    ugrep
    neofetch
    fastfetch

    ###############################################
    #        SECURITY & PASSWORDS                 #
    ###############################################
    bitwarden-desktop
    # libsForQt5.kwalletmanager

    ###############################################
    #         DEVELOPMENT TOOLS                   #
    ###############################################
    github-desktop
    # docker
    # docker-client
    # emacsPackages.docker

    ###############################################
    #           RGB CONTROL                       #
    ###############################################
    openrgb

    ###############################################
    #        THEMING & APPEARANCE                 #
    ###############################################
    arc-theme
    arc-kde-theme
    papirus-icon-theme
    arc-icon-theme
  ];
}
