{
  description = "title";
  # bulding assets
  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixgl.url = "github:guibou/nixGL";
      home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nur = {                                                     
        url = "github:nix-community/NUR";                
      };
      neovim = {
        url = "github:neovim/neovim?dir=contrib";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  outputs = { self, nixpkgs, home-manager, nur, nixgl, neovim, ... }@ inputs:
    let
      system = "x86_64-linux";
      user = "anower";
      host = "nixos";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ nixgl.overlay nur.overlay neovim.overlay];
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (
        # NixOS configurations
        import ./nix {
          # Imports ./nix/default.nix
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user host system pkgs; # Also inherit home-manager so it does not need to be defined here.
        }
      );
      homeConfigurations = (
        # Non-NixOS configurations
        import ./nix {
          inherit (pkgs) lib;
          inherit inputs pkgs home-manager nixgl user host system;
        }
      );
    };
}
