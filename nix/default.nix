{ lib, inputs, nixpkgs, home-manager, user, host, hyprland, doom-emacs, ... }:
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
      #nix core config
      ./configuration.nix
      #nix home-manager config inside nix modules
      hyprland.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs user host hyprland doom-emacs;
          };
          users.${user} = {
            imports = [ ../home/home.nix doom-emacs.hmModule ];
          };
        };
      }
    ];
  };
}
