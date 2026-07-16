{ config, ... }:

{
  # ==========================================
  # Services and Daemons Configuration
  # ==========================================

  # Virtual Private Network
  services.tailscale.enable = true;
  
  # Containerization and Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker.enable = true;
  users.groups.libvirtd.members = [ "amiel" ];
  virtualisation.spiceUSBRedirection.enable = true;
  
  # Power Profiles Daemon (needed for powermode.sh)
  services.power-profiles-daemon.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Flatpak
  services.flatpak.enable = true;

  # GPU mode
  # services.supergfxd.enable = true;
}
