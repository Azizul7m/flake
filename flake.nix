{
  description = "title";
  inputs =
    {
      nixpkgs = {
        url = "nixpkgs/nixos-unstable";
        inputs = { };
      };
    };
  outputs = { self, nixpkgs, nixosConfig, ... }:
    let
      user = "anower";
      host = "nix";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      lib = nixpkgs.lib;
    in
    {
      nixosConfiguration = {
        mySystem = lib.nixosSystem
          {
            system = system;
            modules = [ ./nix/configuration.nix ];
          };
        nixosConfig = {
          config = "nixosConfiguration.mySystem";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      };
    };
}
