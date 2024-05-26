{
  description = "A very basic flake";
  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
#      url = "github:nix-community/home-manager/release-23.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";};
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlang = {url = "github:hyprwm/hyprlang";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    hyprland-plugins = {url = "github:hyprwm/hyprland-plugins";
        inputs.hyprland.follows = "hyprland";
    };
  };
  outputs = inputs@{ self, nixpkgs, hyprland, ... }: let
      var = rec {
        system = "x86_64-linux";
        host = "nixos";
        user = "anower";
        fullName = "Anower Hossen";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-stable = import inputs.nixpkgs-stable {
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
            { nixpkgs.overlays = [ inputs.nur.overlay ]; }
#            inputs.stylix.nixosModules.stylix
            ./host/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${var.user} ={
                  imports= [

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
