{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.reversing;
in {
  options.ctf.reversing = {
    enable = mkEnableOption "Enable CTF Reverse Engineering tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ghidra
      radare2
      gdb
      binutils # Includes objdump, readelf, strings
      strace
      ltrace
      patchelf
      upx
      gcc
      clang
      gnumake
      cmake

      # Custom shell script to safely inspect a binary
      (writeShellScriptBin "re" ''
        if [ -z "$1" ]; then
          echo "Usage: re <binary>"
          exit 1
        fi
        
        echo "=== FILE INFO ==="
        ${pkgs.file}/bin/file "$1"
        
        echo -e "\n=== CHECKSEC ==="
        # Basic checksec if available
        if command -v checksec > /dev/null; then
          checksec --file="$1"
        else
          echo "checksec not available"
        fi
        
        echo -e "\n=== LDD ==="
        ldd "$1" 2>/dev/null || echo "Not a dynamic executable"
      '')
    ];
  };
}
