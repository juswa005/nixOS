{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.networking;
in {
  options.ctf.networking = {
    enable = mkEnableOption "Enable CTF Networking/Packet Analysis tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wireshark
      wireshark-cli # provides tshark
      tcpdump
      nmap
      netcat-gnu
      socat
      iproute2
      iputils
      bind
      aircrack-ng

      (writeShellScriptBin "pcap" ''
        if [ -z "$1" ]; then
          echo "Usage: pcap <capture.pcap>"
          exit 1
        fi
        
        echo "=== PCAP INFO (capinfos) ==="
        ${pkgs.wireshark-cli}/bin/capinfos "$1"
      '')
    ];

    # Make Wireshark usable by normal user (amiel)
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    
    # ensure amiel is in the wireshark group
    users.users.amiel.extraGroups = [ "wireshark" ];
  };
}
