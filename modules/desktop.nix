{ pkgs, ... }:

{
  # ==========================================
  # Desktop Environment and Graphics Configuration
  # ==========================================

  # Display Manager and Window Manager
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Dconf for GNOME apps and theming
  programs.dconf.enable = true;

  # Fonts configuration
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  # Nvidia GPU Configuration
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };
}
