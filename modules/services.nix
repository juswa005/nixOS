{ config, ... }:

{
  # ==========================================
  # Services and Daemons Configuration
  # ==========================================

  # Virtual Private Network
  services.tailscale.enable = true;
  
  # Containerization
  virtualisation.docker.enable = true;

  # Power Profiles Daemon (needed for powermode.sh)
  services.power-profiles-daemon.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Flatpak
  services.flatpak.enable = true;
}
