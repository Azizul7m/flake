{
  description = "title";
  # bulding assets
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nixgl.url = "github:guibou/nixGL";
      home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
      };
      #Emacs
      emacs-overlay = {                                                     # Emacs Overlays
        url = "github:nix-community/emacs-overlay";
        flake = false;
      };

      doom-emacs = {                                                        # Nix-community Doom Emacs
        url = "github:nix-community/nix-doom-emacs";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.emacs-overlay.follows = "emacs-overlay";
      };

      # Official Hyprland flake
      hyprland = {
        url = "github:vaxerski/Hyprland"; # Add "hyprland.nixosModules.default" to the host modules
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  outputs = { self, nixpkgs, home-manager, nixgl, hyprland, doom-emacs, ... }@ inputs:
    let
      system = "x86_64-linux";
      user = "anower";
      host = "nixos";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ nixgl.overlay ];
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (
        # NixOS configurations
        import ./nix {
          # Imports ./nix/default.nix
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user host system pkgs hyprland doom-emacs; # Also inherit home-manager so it does not need to be defined here.
        }
      );
      homeConfigurations = (                                                # Non-NixOS configurations
        import ./nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager nixgl user host system;
        }
      );
    };
}
