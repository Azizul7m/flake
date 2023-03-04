{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url= "github:nixos/nixpkgs/nixos-unstable";
    home-manager= {
      url= github:nix-community/home-manager;
      inputs.nixpkgs.follows= "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      user= "vm";
      system = "x86_64-linux";
      pkgs= import nixpkgs {
        inherit system;
        config.allowUnfree= true;
      };
      lib= nixpkgs.lib;
    in 
      {
        nixosConfigurations= {
          anower= lib.nixosSystem {
            inherit system;
            modules = [
              ./configuration.nix
                home-manager.nixosModules.home-manager {
                  home-manager.useGlobalPkgs= true;
                  home-manager.useUserPackages= true;
                  home-manager.users.anower= {
                    imports= [ ./home.nix ];
                  };
                }
            ];
          };
        };
        homeManagerConfig= {
          anower= home-manager.lib.homeManagerConfiguration {
            inherit system pkgs;
            username= "anower";
            homeDirectory= "/home/anower";
            configuration= {
              imports= [
                ./home.nix
              ];
            };
          };
        };
      };
}
