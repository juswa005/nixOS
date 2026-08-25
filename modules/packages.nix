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
    ngrok
    superfile
    mpd
    ncmpcpp
    mpc
    cava
    killall
    qwen-code

    # python packages
    (python3.withPackages (ps: with ps; [
      pwntools
      pycryptodome
    ]))

    # Hyprland & Wayland Environment
    waybar
    quickshell
    dunst
    wofi
    hyprpaper
    swaybg
    xdg-desktop-portal-hyprland
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
    zscroll
    pavucontrol
    networkmanagerapplet
    overskride
    tailscale
    qbittorrent
    udiskie

    # Applications
    kitty
    nautilus
    spotify
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

    # Theming & Appearance
    adwaita-icon-theme
    papirus-icon-theme
    gnome-themes-extra

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
    tcpdump
    nmap        # Network scanning
    wireshark   # Packet analysis
    burpsuite   # Web vulnerability scanner/proxy
    gobuster    # Directory/file enumeration
    ffuf        # Fast web fuzzer
    hashcat     # Password cracking
    john        # Password cracking (John the Ripper)
    binwalk     # Firmware analysis
    steghide    # Steganography
    exiftool    # Metadata extraction
    ghidra      # Reverse engineering
    radare2     # Reverse engineering
    gdb         # GNU Debugger
    # pwndbg      # GDB plugin for exploit dev
    sqlmap      # SQL injection tool
    socat       # Multipurpose relay
    netcat-gnu  # Networking utility
    thc-hydra   # Network logon cracker
    aircrack-ng # WiFi security
  ];

}
