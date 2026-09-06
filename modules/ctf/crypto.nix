{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.crypto;
in {
  options.ctf.crypto = {
    enable = mkEnableOption "Enable CTF Crypto tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hashcat
      john
      openssl
      thc-hydra
    ];
  };
}
