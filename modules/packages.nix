

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
    libnotify

    # System & Networking
    brightnessctl
    playerctl
    pavucontrol
    networkmanagerapplet
    overskride
    tailscale

    # Applications
    kitty
    chromium
    nautilus
    spotify
    gnome-calculator
    localsend
    vivaldi

    # Theming & Appearance
    adwaita-icon-theme
    gnome-themes-extra

    # Development & Virtualization
    vscodium
    nodejs
    quickemu
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
