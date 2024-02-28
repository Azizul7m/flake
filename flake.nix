{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nur.url = github:nix-community/NUR;

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, nur, nixpkgs-unstable, home-manager, ... }:
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
            ({ pkgs, ... }:
            let
                nur-no-pkgs = import nur {
                nurpkgs = import nixpkgs { system = "x86_64-linux"; };
                };
            in {
                imports = [ nur-no-pkgs.repos.iopq.modules.xraya  ];
                services.xraya.enable = true;
            })
            ./host/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${var.user} =
                  import ./home/home.nix { inherit inputs var; };
              };
            }
          ];
        };
      };
    };
}
