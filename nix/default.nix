{ lib, inputs, nixpkgs, home-manager, user, host, ... }:
let
  system = "x86_64-linux";
in
{
  ${host} = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user;
    };
    modules = [
      ./configuration.nix
    ];
  };
}
