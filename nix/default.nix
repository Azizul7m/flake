{ inputs, nixpkgs, lib, user, full_name, host, system, ... }: {
  # Available through 'nixos-rebuild --flake .#your-hostname'
  ${host} = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs lib user full_name host nixpkgs system; };
    modules = [
      ./configuration.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs user host nixpkgs system; };
          users.${user} = import ../home/home.nix;
        };
      }
    ];
  };
}
