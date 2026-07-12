{ config, pkgs, ... }:

{
  environment.shellAliases = {
    # Basic commands
    l = "ls -l";
    la = "ls -la";
    c = "clear";
    n = "nvim"; 

    # System update
    nix-update = "sudo nixos-rebuild switch --flake .#nixos";
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "ghc" ''
      if [ -z "$1" ]; then
        echo "Error: Commit message required."
        echo "Usage: ghc \"your commit message\""
        exit 1
      fi
      
      git add .
      git commit -m "$1"
      git push
    '')
  ];
}
