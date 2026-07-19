{ pkgs, ... }:

{
  # ==========================================
  # Desktop Environment and Graphics Configuration
  # ==========================================

  # Display Manager and Window Manager
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;
  programs.gpu-screen-recorder.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Dconf for GNOME apps and theming
  programs.dconf.enable = true;
  # SSHASKPASS shit
  programs.ssh.askPassword = "";

  # Fonts configuration
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  # GPU Drivers
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  # Nvidia GPU Configuration
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;

    # Enable NVIDIA Runtime D3 (Automatic Sleep)
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Enable PRIME Offload and define your hardware IDs
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
