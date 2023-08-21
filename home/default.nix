{ lib, inputs, nixpkgs, system, home-manager, user, host, ... }:

let
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  # Currently only host that can be built
  ${host} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit pkgs host user home-manager; };
    modules = [
      ./home.nix
      ../modules/sys/gtk.nix
      {
        home = {
          username = "${user}";
          homeDirectory = "/home/${user}";
          packages = [ pkgs.home-manager ];
          stateVersion = "23.05";
        };
      }
    ];
  };
}
