{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.ctf.utilities;

  # Create an isolated python environment for CTF scripts
  ctfPython = pkgs.python3.withPackages (ps: with ps; [
    requests
    beautifulsoup4
    pwntools
    capstone
    keystone-engine
    pefile
    yara-python
    scapy
  ]);
in {
  options.ctf.utilities = {
    enable = mkEnableOption "Enable CTF Utilities";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      yq
      # note: jq, unzip, zip, p7zip, gzip, bzip2, xz, zstd are often global or already in packages.nix.
      # We add the python environment as a specific binary so it doesn't conflict with global python
      (writeShellScriptBin "ctf-python" ''
        exec ${ctfPython}/bin/python "$@"
      '')
      steghide
      checksec
    ];
  };
}
