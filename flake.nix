{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    emacs-overlay.url = "github:nix-community/emacs-overlay";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
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
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit flake-utils host user userEmail fullName inputs pkgs;
          };
          modules =
            [ inputs.stylix.nixosModules.stylix ./host/configuration.nix ];
        };
      };
      homeConfigurations."${host}" =
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ inputs.emacs-overlay.overlay ];
          };
          extraSpecialArgs = {
            inherit flake-utils host user userEmail fullName inputs pkgs;
          };
          modules = [ ./home/home.nix ];
        };
    };
}
