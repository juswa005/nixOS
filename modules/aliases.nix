{ config, pkgs, ... }:

{
  environment.shellAliases = {
    # Basic commands
    l = "ls -l";
    la = "ls -la";
    c = "clear";
    n = "nvim";
    dps = "docker ps";
    dcu = "docker compose up --build -d";
    dcd = "docker compose down"; 
    fz = "fzf --preview='bat --style=plain --color=always {}'";
    f = "frieren";


    # System update
    nrs = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
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
