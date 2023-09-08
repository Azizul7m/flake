{ lib, inputs, nixpkgs, system, home-manager, user, host, ... }:

let pkgs = nixpkgs.legacyPackages.${system};
in {
  # Currently only host that can be built
  ${host} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit pkgs host user home-manager; };
    modules = [ import (../theme/ui.nix) ] ++ [ import (./home.nix) ];
  };
}
