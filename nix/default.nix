{ inputs, nixpkgs, lib, user, full_name, host, system, home-manager, ... }: {
  # Available through 'nixos-rebuild --flake .#your-hostname'
  ${host} = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs lib user full_name host home-manager nixpkgs system;
    };
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs user host nixpkgs home-manager system;
          };
          users.${user} = { imports = [ ../home/home.nix ]; };
        };
      }
    ];
  };
}
