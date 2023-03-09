# arg
{ lib, inputs, system, home-manager, user, host, ... }:
let
  system = "x86_64-linux";                                  # System architecture

  pkgs = import nixpkgs {
    # inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  ${host} = lib.nixosSystem {
    inherit system user;
    modules = [
      ./configuration.nix
      # home-manager with host
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = {
          imports = [ /home/${user}/.config/nixpkgs/home.nix ];
        };
      }
    ];
  };
}
