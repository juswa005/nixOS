{ config, ... }:

{
  # ==========================================
  # Networking and Firewall Configuration
  # ==========================================

  networking.hostName = "Amaia"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Firewall configuration
  networking.firewall = {
    enable = true;
    # Allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];
    # Optional: Trust the Tailscale interface for easier local networking
    trustedInterfaces = [ "tailscale0" ];
  };
}
