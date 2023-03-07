{ system, home-manger, host, user }:
{
  ${host} = home-manager.lib.homeManagerConfiguration {
    inherit system user;
    username = "${user}";
    homeDirectory = "/home/${user}";
    configuration = {
      imports = [
        ../home.nix
      ];
    };
  };
}
