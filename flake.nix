{
  description = "A very basic flake";
  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      # url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    nur.url = "github:nix-community/NUR";
    emacs-overlay.url = "github:nix-community/emacs-overlay";

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      var = rec {
        system = "x86_64-linux";
        host = "nixos";
        user = "anower";
        fullName = "Azizul Islam";
        userEmail = "azizul7m@gmail.com";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            inputs.nur.overlay
            inputs.emacs-overlay.overlay
            inputs.hyprpanel.overlay
          ];
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
          modules =
            [ inputs.stylix.nixosModules.stylix ./host/configuration.nix ];
        };
      };
      homeConfigurations."${var.host}" =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs var; };
          modules = [ ./home/home.nix ];
        };
    };
}
