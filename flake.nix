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
      host = "nix";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (
        import ./nix { inherit lib nixpkgs self inputs host user; }
      );
    };
}
