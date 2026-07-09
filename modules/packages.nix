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

    # Applications
    kitty
    nautilus
    spotify
    gnome-calculator
    localsend

    # Theming & Appearance
    adwaita-icon-theme
    gnome-themes-extra

    # Development & Virtualization
    vscodium
    nodejs
    quickemu

    # Minecraft
    prismlauncher
    (mcpelauncher-ui-qt.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or []) ++ [
        (pkgs.writeText "googleaccount.patch" ''
diff --git a/mcpelauncher-ui-qt/googleloginhelper.cpp b/mcpelauncher-ui-qt/googleloginhelper.cpp
--- a/mcpelauncher-ui-qt/googleloginhelper.cpp
+++ b/mcpelauncher-ui-qt/googleloginhelper.cpp
@@ -1,6 +1,7 @@
 #include "googleloginhelper.h"
 
 #include <googleloginwindow.h>
+#include <QQmlEngine>
 #include <QStandardPaths>
 #include <QDir>
 #include <QWindow>
@@ -14,6 +15,7 @@
 }
 
 GoogleLoginHelper::GoogleLoginHelper() : loginCache(getTokenCachePath()), login(device, loginCache) {
+    QQmlEngine::setObjectOwnership(&currentAccount, QQmlEngine::CppOwnership);
     unlockkey = settings.value("key").toString();
     loadAccount();
 }
        '')
      ];
    }))
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
