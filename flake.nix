{
  description = "title";
  # bulding assets
  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixgl.url = "github:guibou/nixGL";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      flake-utils.url = "github:numtide/flake-utils";
      nur = {
        url = "github:nix-community/NUR";
      };
      neovim = {
        url = "github:neovim/neovim?dir=contrib";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # emacs
      nix-doom-emacs = {
        url = "github:nix-community/nix-doom-emacs";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      emacs = {
        url = "github:nix-community/emacs-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.flake-utils.follows = "flake-utils";
      };

      emacs-overlay = {                                                     # Emacs Overlays
        url = "github:nix-community/emacs-overlay";
        flake = false;
      };

      doom-emacs = {                                                        # Nix-community Doom Emacs
        url = "github:nix-community/nix-doom-emacs";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.emacs-overlay.follows = "emacs-overlay";
      };
    };
  outputs = { self, nixpkgs, home-manager, nur, nixgl, neovim, doom-emacs, ... }@ inputs:
    let
      system = "x86_64-linux";
      user = "anower";
      host = "nixos";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ nixgl.overlay nur.overlay neovim.overlay ];
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (
        # NixOS configurations
        import ./nix {
          # Imports ./nix/default.nix
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user host system pkgs doom-emacs; # Also inherit home-manager so it does not need to be defined here.
        }
      );
      homeConfigurations = (
        # Non-NixOS configurations
        import ./home {
          inherit (pkgs) lib;
          inherit inputs pkgs home-manager nixgl user host system;
        }
      );
    };
}
