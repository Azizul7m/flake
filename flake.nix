{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    agenix = {
      url="github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #  catppuccin = {
    #  url = "github:catppuccin/nix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    let
      system = "x86_64-linux";
      host = "nixos";
      user = "anower";
      fullName = "Azizul Islam";
      userEmail = "azizul7m@gmail.com";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          inputs.emacs-overlay.overlay
        ];
      };

    in {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit flake-utils host user userEmail fullName inputs pkgs;
          };
          modules =
            [ ./host/configuration.nix
               inputs.home-manager.nixosModules.home-manager {
                 home-manager = {
                   useGlobalPkgs = true; 
                   useUserPackages = true;
                   extraSpecialArgs = { inherit flake-utils host user userEmail fullName inputs; };
                   users."${user}" = import ./home/home.nix;
                 };
               }
            ];
        };
      };
      #  homeConfigurations."${host}" = inputs.home-manager.lib.homeManagerConfiguration {
      #    inherit pkgs;
      #    extraSpecialArgs = {
      #      inherit flake-utils host user userEmail fullName inputs;
      #    };
      #    modules = [
      #      inputs.agenix.homeManagerModules.default
        #      inputs.catppuccin.homeModules.catppuccin
      #  ./home/home.nix ];
      #   };
    };
}
