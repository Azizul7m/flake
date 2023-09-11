{ lib, inputs, nixpkgs, system, user, host, ... }:

let pkgs = nixpkgs.legacyPackages.${system};
in {
  # Currently only host that can be built
  ${host} = inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit pkgs host user inputs; };
    modules = [ inputs.nix-colors.homeManagerModules.default ./home.nix ];
  };
}
