{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.forensics;
in {
  options.ctf.forensics = {
    enable = mkEnableOption "Enable CTF Forensics tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      file
      binwalk
      exiftool
      hexyl
      foremost
      sleuthkit
      testdisk
      autopsy
      volatility3
      yara
      libguestfs
      qemu

      # Custom shell script for basic safe static analysis
      (writeShellScriptBin "forensic" ''
        if [ -z "$1" ]; then
          echo "Usage: forensic <file>"
          exit 1
        fi
        
        echo "=== FILE INFO ==="
        ${pkgs.file}/bin/file "$1"
        
        echo -e "\n=== BINWALK ==="
        ${pkgs.binwalk}/bin/binwalk "$1"
        
        echo -e "\n=== STRINGS (First 10 lines) ==="
        ${pkgs.binutils}/bin/strings "$1" | head -n 10
      '')
    ];
  };
}
