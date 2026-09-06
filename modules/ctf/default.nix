{ config, lib, pkgs, ... }:

{
  imports = [
    ./forensics.nix
    ./osint.nix
    ./reversing.nix
    ./networking.nix
    ./crypto.nix
    ./web.nix
    ./utilities.nix
  ];
}
