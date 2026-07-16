{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      mcpelauncher-ui-qt = prev.mcpelauncher-ui-qt.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          (builtins.toFile "mcpelauncher-googleaccount-parent.patch" ''
            diff --git a/mcpelauncher-ui-qt/googleaccount.h b/mcpelauncher-ui-qt/googleaccount.h
            index f81a29b..bb32349 100644
            --- a/mcpelauncher-ui-qt/googleaccount.h
            +++ b/mcpelauncher-ui-qt/googleaccount.h
            @@ -15,6 +15,8 @@ private:
                 QString m_accountToken;
             
             public:
            +    explicit GoogleAccount(QObject* parent = nullptr) : QObject(parent) {}
            +
                 QString const& accountIdentifier() const { return m_accountIdentifier; }
                 QString const& accountUserId() const { return m_accountUserId; }
                 QString const& accountToken() const { return m_accountToken; }
            diff --git a/mcpelauncher-ui-qt/googleloginhelper.cpp b/mcpelauncher-ui-qt/googleloginhelper.cpp
            index 461b306..f285a6f 100644
            --- a/mcpelauncher-ui-qt/googleloginhelper.cpp
            +++ b/mcpelauncher-ui-qt/googleloginhelper.cpp
            @@ -13,7 +13,7 @@ std::string GoogleLoginHelper::getTokenCachePath() {
                 return QDir(QStandardPaths::writableLocation(QStandardPaths::CacheLocation)).filePath("playapi_token_cache.conf").toStdString();
             }
             
            -GoogleLoginHelper::GoogleLoginHelper() : loginCache(getTokenCachePath()), login(device, loginCache) {
            +GoogleLoginHelper::GoogleLoginHelper() : loginCache(getTokenCachePath()), login(device, loginCache), currentAccount(this) {
                 unlockkey = settings.value("key").toString();
                 loadAccount();
             }
          '')
        ];
      });
    })
  ];

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

  # Shell configuration
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      starship init fish | source
      zoxide init fish | source
      alias ls="eza --icons"
      alias ll="eza -l --icons"
      alias la="eza -la --icons"
    '';
  };
}
