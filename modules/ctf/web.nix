{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.web;
in {
  options.ctf.web = {
    enable = mkEnableOption "Enable CTF Web tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      burpsuite
      gobuster
      ffuf
      sqlmap
    ];
  };
}
