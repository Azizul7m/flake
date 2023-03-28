{lib, inputs, nixpkgs, system, home-manager, nixgl, user, host, ...}:

let
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  ${host} = home-manager.lib.homeManagerConfiguration {    # Currently only host that can be built
    inherit pkgs;
    extraSpecialArgs = { inherit inputs nixgl user; };
    modules = [
      ./home.nix
      {
        home = {
          username = "${user}";
          homeDirectory = "/home/${user}";
          packages = [ pkgs.home-manager ];
          stateVersion = "22.11";
        };
      }
    ];
  };
}
