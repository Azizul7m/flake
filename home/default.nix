{lib, inputs, pkgs, system, home-manager, nixgl, user, host, doom-emacs, ...}:

let
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  ${host} = home-manager.lib.homeManagerConfiguration {    # Currently only host that can be built
    inherit pkgs;
    extraSpecialArgs = { inherit inputs nixgl user doom-emacs ; };
    modules = [
      ./home.nix
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
