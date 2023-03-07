{
  description = "Flake for Nixos and Hyprland compositor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      # OpenGL
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      # Emacs Overlays
      url = "github:nix-community/emacs-overlay";
      flake = false;
    };

    doom-emacs = {
      # Nix-community Doom Emacs
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.emacs-overlay.follows = "emacs-overlay";
    };

    hyprland = {
      # Official Hyprland flake
      url = "github:vaxerski/Hyprland"; # Add "hyprland.nixosModules.default" to the host modules
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixgl, emacs-overlay, doom-emacs, hyprland }:
    let
      # variables
      user = "anower";
      host = "nix";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      # Main Host
      nixosConfigurations = (
        # NixOS configurations
        import ./hosts
          {
            # Imports ./hosts/default.nix
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs home-manager user doom-emacs hyprland; # Also inherit home-manager so it does not need to be defined here.
          }
      );
      # home-manager configuration
      homeConfigurations = (
        # Non-NixOS configurations
        import ./nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager nixgl user host;
        }
      );
    };
}
