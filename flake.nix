{
  description = "Personal flake of Azizul7m";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    nur = { url = "github:nix-community/NUR"; };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, fenix, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      user = "anower";
      full_name = "Anower Hossain";
      host = "nixos";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ nur.overlay ];
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = (
        # NixOS configurations
        # Imports ./nix/default.nix
        import ./nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs user full_name host system pkgs home-manager;
        });

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = (import ./home {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager user host system pkgs;
      });
    };
}
