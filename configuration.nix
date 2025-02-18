# System Configuration for NixOS
# https://gitlab.com/jacinthsamuel/nixos/-/blob/master/configuration.nix?ref_type=heads
# https://github.com/ValentinMENDIss/Dotfiles/tree/main/Distributions/NixOS
# https://github.com/ChrisTitusTech/nixos-titus.git
# https://github.com/sytriz/dotfiles.git
# https://github.com/TechsupportOnHold
# https://youtu.be/CwfKlX3rA6E?si=CGSmYdMGPsdEmqA9
# TODO xdg.mime.defaultApplications
# sudo nixos-rebuild switch -I nixos-config=~/nixos/configuration.nix
# sudo nixos-rebuild switch -I nixos-config=/home/ayako/nixos/configuration.nix
# sudo nixos-rebuild --install-lbootloader boot
# sudo nixos-rebuild --install-bootloader boot -I nixos-config=/home/ayako/nixos/configuration.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./vm.nix
    ./DE-WM.nix
    ./defaults-apps.nix
    ./py.nix
    ./ZonosAi.nix
    # ./ai.nix
    # ./pci.nix
  ];

  #
  # BOOT CONFIGURATION
  #
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  #
  # NETWORKING
  #
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

nix.settings = {
  experimental-features = ["nix-command" "flakes"];
};

  #
  # HARDWARE AND SOUND
  #
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    graphics = {
      # this is for Davinci Resolve err fix "Unsupported GPU Processing Mode"
      enable = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };

  # Sound Configuration
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  #
  # LOCALIZATION
  #
  time.timeZone = "Asia/Kolkata";
  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.utf8";
      LC_IDENTIFICATION = "en_US.utf8";
      LC_MEASUREMENT = "en_US.utf8";
      LC_MONETARY = "en_US.utf8";
      LC_NAME = "en_US.utf8";
      LC_NUMERIC = "en_US.utf8";
      LC_PAPER = "en_US.utf8";
      LC_TELEPHONE = "en_US.utf8";
      LC_TIME = "en_US.utf8";
    };
  };

  #
  # DISPLAY SERVER AND DESKTOP ENVIRONMENT
  #
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  #
  # SYSTEM SERVICES
  #

  services = {
    locate.enable = true;
    printing.enable = true;
    openssh.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
    hardware.openrgb.enable = true;
    gnome.gnome-keyring.enable = true;
    libinput.touchpad.naturalScrolling = true;
    libinput.mouse.accelProfile = "flat"; # disable mouse acceleration
    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };
  };

  #
  # SECURITY AND SYSTEM FEATURES
  #
  security = {
    polkit.enable = true;
    pam.services.lightdm.enableGnomeKeyring = true;
  };

  #
  # USER CONFIGURATION
  #
  users = {
    users.ayako = {
      isNormalUser = true;
      description = "ayako";
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
        "docker"
      ];
      packages = with pkgs; [ ];
    };
    defaultUserShell = pkgs.fish;
  };

  #
  # PROGRAM CONFIGURATIONS
  #
  programs = {
  nix-ld.enable = true;
  fish.enable = true;
  nm-applet.enable = true;
  #noisetorch.enable = true;
  firefox.enable = true;
  #  steam.enable = true;
  thunar = {
    enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  #
  # SYSTEM PACKAGES
  #
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config = {
    permittedInsecurePackages = [
      "qbittorrent-4.6.4"
      "archiver-3.5.1"
    ];
  };

  # Base system packages
  environment.systemPackages = with pkgs; [
    ###############################################
    #           TEXT EDITORS                      #
    ###############################################
    vim
    neovim
    code-cursor
    obsidian
    helix
    tree
    ((pkgs.emacsPackagesFor pkgs.emacs30).emacsWithPackages (epkgs: [ epkgs.vterm ]))
    emacsPackages.jinx
    # aspell
    hunspell
    hunspellDicts.en-us-large
    nixfmt-rfc-style
    nil
    libsForQt5.kdenlive
    blanket
    flameshot
    

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
    p7zip
    findutils
    os-prober
    ntfs3g
    stow
    acpi
    brightnessctl
    appimage-run
    ripgrep
    pciutils

    ###############################################
    #    DESKTOP ENVIRONMENT & WINDOW MANAGER     #
    ###############################################
    alacritty
    dmenu
    rofi
    sxhkd
    picom
    polkit_gnome
    gnome-font-viewer
    eog
    nitrogen
    normcap
    copyq
    
    ###############################################
    #         AUDIO & VIDEO TOOLS                 #
    ###############################################
    vlc
    #    davinci-resolve
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
    telegram-desktop
    google-chrome
    freetube
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
    docker
    # docker-client
    # emacsPackages.docker

    ###############################################
    #           RGB CONTROL                       #
    ###############################################
    openrgb

    ###############################################
    #        THEMING & APPEARANCE                 #
    ###############################################
    lxappearance
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    arc-theme
    arc-kde-theme
    papirus-icon-theme
    arc-icon-theme
  ];
# docker
  virtualisation.docker.enable = true;


  # Power-Management
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
  # Disable Double Click Prevention
  # https://www.reddit.com/r/NixOS/comments/1irqtje/comment/mdc5js3/?context=3
  environment.etc."libinput/local-overrides.quirks".text = ''
  [Never Debounce]
  MatchUdevType=mouse
  ModelBouncingKeys=1
'';

# syncthing
  # services.syncthing.systemService = true;
  # services.syncthing.enable = true;

  #
  # FONTS
  #
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono LG M Regular Nerd Font Complete Mono" ];
        serif = [
          "Noto Serif"
          "Source Han Serif"
        ];
        sansSerif = [
          "Noto Sans"
          "Source Han Sans"
        ];
      };
    };
  };

  #
  # XDG AND ENVIRONMENT
  #
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  environment = {
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
    variables = {
      EDITOR = "emacsclient -c";
      VISUAL = "emacsclient -c";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_QPA_PLATFORM= "xcb";
    };
  };

  # System State Version
  system.stateVersion = "24.11";
}
