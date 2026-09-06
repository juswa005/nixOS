{ pkgs, ... }:

{
  # ==========================================
  # System Packages and Programs Configuration
  # ==========================================

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Core & CLI Utilities
    wget
    git
    vim
    neovim
    curl
    htop
    btop
    fastfetch
    tmux
    starship
    zoxide
    fzf
    eza
    dysk
    tree
    ncdu
    yazi
    browsh
    lazygit
    qbittorrent-cli
    zoxide
    lazydocker
    wifitui
    pulsemixer
    nvtopPackages.amd
    bat
    stow
    tmux
    glow
    llmfit
    ollama
    ffmpeg
    slurp
    unzip
    file-roller
    ngrok
    superfile
    mpd
    ncmpcpp
    mpc
    cava
    pipes
    killall
    zellij
    opencode


    # python packages
    (python3.withPackages (ps: with ps; [
      # Python packages moved to ctf/utilities.nix
    ]))

    # Hyprland & Wayland Environment
    waybar
    quickshell
    dunst
    wofi
    hyprpaper
    swaybg

    wl-clipboard
    cliphist
    grim
    hyprshot
    hyprsunset
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprsysteminfo
    hyprcursor
    libnotify

    # System & Networking
    brightnessctl
    playerctl
    pavucontrol
    networkmanagerapplet
    overskride
    tailscale
    qbittorrent
    udiskie

    # Applications
    kitty
    gnome-calculator
    localsend
    mpv
    onlyoffice-desktopeditors
    gparted
    parted
    efibootmgr
    feh
    nicotine-plus
    supersonic
    firefox
    blender
    cura-appimage
    nasm
    obsidian
    nautilus


    # Theming & Appearance
    adwaita-icon-theme
    papirus-icon-theme
    gnome-themes-extra
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct

    # Development & Virtualization
    vscodium
    nodejs
    distrobox

    # Minecraft
    mcpelauncher-client
    mcpelauncher-ui-qt

    # PlatformIO
    platformio
    platformio-core
    platformio-chrootenv
    
    # EDA Softwares
    librepcb
    fritzing

    # CTF & Security Tools
    # Note: These have been moved to the modular CTF configuration in /etc/nixos/modules/ctf/
    # Enable them in configuration.nix via ctf.*.enable = true;
  ];

}
