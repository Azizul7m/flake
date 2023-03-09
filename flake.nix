{
  description = "title";
  # bulding assets
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };
  outputs = { self, nixpkgs, nixosConfig, ... }:
    let
      system = "x86_64-linux";
      user = "anower";
      host = "nix";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        ${host} = lib.nixosSystem {
          inherit system;
          modules = [ ./nix/configuration.nix ];
        };
      };
    };
}
