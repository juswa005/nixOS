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

    # Hyprland & Wayland Environment
    waybar
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
    pavucontrol
    networkmanagerapplet
    overskride
    tailscale
    qbittorrent

    # Applications
    kitty
    nautilus
    spotify
    gnome-calculator
    localsend
    #dbeaver-bin
    mpv
    onlyoffice-desktopeditors
    gparted
    parted
    efibootmgr
    feh
    lmstudio

    # Theming & Appearance
    adwaita-icon-theme
    gnome-themes-extra

    # Development & Virtualization
    vscodium
    nodejs
    distrobox

    # Minecraft
    prismlauncher
    mcpelauncher-client
    mcpelauncher-ui-qt

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
