# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# https://github.com/ChrisTitusTech/nixos-titus.git
# https://github.com/sytriz/dotfiles.git
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
#  boot.loader.systemd-boot.enable = true;
 # boot.loader.efi.canTouchEfiVariables = true;

boot.loader.grub.enable = true;
boot.loader.grub.device = "nodev";
boot.loader.grub.useOSProber = true;
boot.loader.grub.efiSupport = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint = "/boot";

# $ nixos-rebuild switch --install-bootloader

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  #Bluetooth
  hardware.bluetooth.enable = true;

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
#  i18n.defaultLocale = "en_IN";
#
#  i18n.extraLocaleSettings = {
#    LC_ADDRESS = "en_IN";
#    LC_IDENTIFICATION = "en_IN";
#    LC_MEASUREMENT = "en_IN";
#    LC_MONETARY = "en_IN";
#    LC_NAME = "en_IN";
#    LC_NUMERIC = "en_IN";
#    LC_PAPER = "en_IN";
#    LC_TELEPHONE = "en_IN";
#    LC_TIME = "en_IN";
#  };
#

  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
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


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the LXQT Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.awesome.enable = true;
#  services.xserver.windowManager.nimdow.enable=true;
#  services.xserver.desktopManager.lxqt.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ayako = {
    isNormalUser = true;
    description = "ayako";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Steam.
  programs.steam.enable = true;

  # List packages installed in system profile. To search, run: #app
  # $ nix search wget 
  environment.systemPackages = with pkgs; [
    vim
    neovim

   bison # build essantials
   flex
   fontforge
   makeWrapper
   pkg-config
   gnumake
   gcc
   libiconv
   autoconf
   automake
   libtool # freetype calls glibtoolize
   cmake
   os-prober
   ntfs3g
   stow

   wget
   git
   fish
   gnumake
   tldr
   xorg.xkill
   zip
   unzip
   qbittorrent
   discord
#   lutris
    acpi
    

   alacritty # form this is my base apps for dwm ..etc
   brightnessctl
   appimage-run
#   gearlever     #only on unstable channal
   dmenu
   rofi
   sxhkd
   picom
   polkit_gnome
   gparted
   bitwarden-desktop
   google-chrome
   vlc
   davinci-resolve
   ffmpeg
   youtube-dl
   gimp
   zoxide
   eza
   trash-cli
   ugrep
   github-desktop
   nitrogen
   neofetch # essancial for nix users
   fastfetch # just for backup
   libsForQt5.kwalletmanager
   openrgb
   pulseaudioFull
   (slstatus.overrideAttrs (_: { src = /home/ayako/dwm2/slstatus; }))
   telegram-desktop

  # Emacs package installation via Nix with Vterm terminal 
  ((pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages ( epkgs: [ epkgs.vterm ] ))

# for theming apps 
   lxappearance
   libsForQt5.qt5ct
   kdePackages.qtstyleplugin-kvantum
   libsForQt5.qtstyleplugin-kvantum
   arc-theme
   arc-kde-theme # for qt apps
   papirus-icon-theme
   arc-icon-theme 

  ];

   hardware.opengl = {
   enable = true;
   extraPackages = with pkgs; [
     rocmPackages.clr.icd
   ];
 };

  nixpkgs.config.permittedInsecurePackages = [
    "qbittorrent-4.6.4"
    "python3.11-youtube-dl-2021.12.17"
  ];

# dwm 
services.xserver.windowManager.dwm.enable = true;
services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
  src = /home/ayako/dwm2;
};

fonts = {
  packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
  fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["JetBrainsMono LG M Regular Nerd Font Complete Mono"];
      serif = ["Noto Serif" "Source Han Serif"];
      sansSerif = ["Noto Sans" "Source Han Sans"];
    };
  };
};

# thunar file-manager
programs.thunar.enable = true;
programs.xfconf.enable = true;
programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
];
services.gvfs.enable = true; # Mount, trash, and other functionalities
services.tumbler.enable = true; # Thumbnail support for images


#OpenRGB
services.hardware.openrgb.enable = true;

#Polkit
security.polkit.enable = true;

#Flatpak
services.flatpak.enable = true;

#xdg.portal
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
xdg.portal.enable = true;
xdg.portal.config.common.default = "*";
#keyring
services.gnome.gnome-keyring.enable = true;
security.pam.services.lightdm.enableGnomeKeyring = true;

# Fish
programs.fish.enable = true;
users.defaultUserShell = pkgs.fish;

# environment variable local for more >> https://nixos.wiki/wiki/Environment_variables
environment.sessionVariables = rec {
  XDG_CACHE_HOME  = "$HOME/.cache";
  XDG_CONFIG_HOME = "$HOME/.config";
  XDG_DATA_HOME   = "$HOME/.local/share";
  XDG_STATE_HOME  = "$HOME/.local/state";
};

environment.variables = {
  QT_QPA_PLATFORMTHEME= "qt5ct";
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
