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
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      user = "anower";
      host = "nix";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      lib = nixpkgs.lib;
      homeCfg = import ./home/home.nix {
        inherit (self) user;
      };
    in
    {
      nixosConfigurations = {
        ${host} = lib.nixosSystem {
          inherit system;
          modules = [
            ./nix/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = {
                imports = [ homeCfg ];
              };
            }
          ];
        };
      };
    };
}
