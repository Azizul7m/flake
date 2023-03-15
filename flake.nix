{
  description = "title";
  # bulding assets
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  outputs = inputs @{ self, nixpkgs, home-manager, ... }:
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
          modules = [
            ./nix/configuration.nix
          ] ++ [
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user} = {
                  imports = [ ./home/home.nix ];
                };
              };
            }
          ];
        };
      };
    };
}
