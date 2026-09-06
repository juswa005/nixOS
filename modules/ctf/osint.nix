{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.osint;
in {
  options.ctf.osint = {
    enable = mkEnableOption "Enable CTF OSINT tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      whois
      bind # Provides dig, nslookup, etc.
      nmap
      curl
      wget
      jq
      ripgrep
      amass
      subfinder
      httpx
      theharvester
      sherlock
    ];
  };
}
