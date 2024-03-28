{
  description = "A very basic flake";
  inputs = {
#    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = github:nix-community/NUR;

    home-manager = {
#      url = "github:nix-community/home-manager/release-23.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock.url = "github:hyprwm/Hyprlock";
  };
  outputs = inputs@{ self, nixpkgs, nur, hyprlock, home-manager, ... }:
    let
      var = rec {
        system = "x86_64-linux";
        host = "nixos";
        user = "anower";
        fullName = "Anower Hossen";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-unstable = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
      };
      system = "x86_64-linux";
      pkgs = var.pkgs;
    in {
      nixosConfigurations = {
        "${var.host}" = var.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs var; };
          modules = [
            { nixpkgs.overlays = [ nur.overlay ]; }
            ./host/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${var.user} ={
                  imports= [
                    hyprlock.homeManagerModules.hyprlock
                    (import ./home/home.nix { inherit inputs var; })
                  ];
                };
              };
            }
          ];
        };
      };
    };
}
