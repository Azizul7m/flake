{ lib, inputs, nixpkgs, home-manager, nur, user, ... }:
let
  inherit system pkgs;
in
{
  desktop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user;
    };
  };
  modules = [
    ./configuration.nix
  ];
}
