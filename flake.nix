{
  description = "title";
  inputs =
    {
      nixpkgs = "nixpkgs/nixos-unstable";
    };
  outputs = { self, nixpkgs, ... }:
    let
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
      nixosConfiguration = {
        mySystem = inputs.lib.nixosSystem
          {
            system = ${system};
            modules = [ ./nix/configuration.nix ];
          };
      };
    };
}
