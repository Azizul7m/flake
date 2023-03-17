{
  description = "title";
  # bulding assets
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  outputs = { self, nixpkgs, home-manager, ... }@ inputs:
    let
      system = "x86_64-linux";
      user = "anower";
      host = "nixos";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
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
    };
}
