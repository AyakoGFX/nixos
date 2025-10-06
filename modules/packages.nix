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
    # Weather app
    mousam
    meteo
    ###############################################
    #                 PDF                         #
    ###############################################
    poppler_utils
    # pdfarranger
    # masterpdfeditor

    ###############################################
    #                 MUSIC                         #
    ###############################################
    lmms

    ###############################################
    #                 linux iceberg               #
    ###############################################
    localsend
    losslesscut-bin
    metadata-cleaner
    # stirling-pdf

    ###############################################
    #           TEXT EDITORS                      #
    ###############################################
    vim
    neovim
    # code-cursor
    vscode
    helix
    # micro
    tree
    # libsForQt5.kdenlive
    # audacity
    blanket
    alacritty
    
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
    # xdg-user-dirs
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
    fd
    fzf
    pciutils
    

    ###############################################
    #    DESKTOP ENVIRONMENT & WINDOW MANAGER     #
    ###############################################

    cava
    gnome-font-viewer
    mission-center
    

    
    ###############################################
    #         AUDIO & VIDEO TOOLS                 #
    ###############################################
    vlc
    # davinci-resolve
    ffmpeg
    handbrake
    pulseaudioFull
    pavucontrol
    obs-studio

    ###############################################
    #      INTERNET & COMMUNICATION               #
    ###############################################
    qbittorrent
    discord
    telegram-desktop
    tmux
    showmethekey
    xdragon
    google-chrome
    # varia # Simple download manager based on aria2 and libadwaita
    aria2
    uget
    # gopeed
    # freetube
    # thunderbird
    # protontricks

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
    ardour # daw
    mpv
    internetarchive
    #gimp
    # inkscape

    ###############################################
    #        SHELL ENHANCEMENTS                   #
    ###############################################
    zoxide
    eza
    trash-cli
    ugrep
    neofetch
    fastfetch
    killall

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
