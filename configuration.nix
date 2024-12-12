# System Configuration for NixOS
# https://gitlab.com/jacinthsamuel/nixos/-/blob/master/configuration.nix?ref_type=heads
# https://github.com/ValentinMENDIss/Dotfiles/tree/main/Distributions/NixOS
# https://github.com/ChrisTitusTech/nixos-titus.git
# https://github.com/sytriz/dotfiles.git
# https://github.com/TechsupportOnHold
# https://youtu.be/CwfKlX3rA6E?si=CGSmYdMGPsdEmqA9
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
  programs.nm-applet.enable = true;

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
    printing.enable = true;
    openssh.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
    hardware.openrgb.enable = true;
    gnome.gnome-keyring.enable = true;
    libinput.touchpad.naturalScrolling = true;
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
      ];
      packages = with pkgs; [ ];
    };
    defaultUserShell = pkgs.fish;
  };

  #
  # PROGRAM CONFIGURATIONS
  #
  programs = {
    fish.enable = true;
    #noisetorch.enable = true;
    #firefox.enable = true;
    # steam.enable = true;
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
    ((pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (epkgs: [ epkgs.vterm ]))
    # aspell
    hunspell
    hunspellDicts.en-us-large
    emacsPackages.jinx
    nixfmt-rfc-style
    # nixd
    nil

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
    unzip
    p7zip
    peazip
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
    nitrogen

    ###############################################
    #         AUDIO & VIDEO TOOLS                 #
    ###############################################
    vlc
    #    davinci-resolve
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
    google-chrome
    thunderbird
    protontricks

    ###############################################
    #      FILE MANAGEMENT & ARCHIVES             #
    ###############################################
    xarchiver
    gparted

    ###############################################
    #          MEDIA & GRAPHICS                   #
    ###############################################
    yt-dlp
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
    libsForQt5.kwalletmanager

    ###############################################
    #         DEVELOPMENT TOOLS                   #
    ###############################################
    github-desktop

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
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };

  # System State Version
  system.stateVersion = "24.11";
}
