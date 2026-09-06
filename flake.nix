{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sonora = {
      url = "github:nolight132/sonora";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, antigravity-nix, helium, sonora, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        {
          environment.systemPackages = [
            antigravity-nix.packages.x86_64-linux.default # Base App
            antigravity-nix.packages.x86_64-linux.google-antigravity-ide # IDE
            antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
            helium.packages.x86_64-linux.default
            sonora.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
