# arg
{ lib, inputs, system, home-manger, user, host, ... }:
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
