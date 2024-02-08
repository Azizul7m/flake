{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url= "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager,  ... }: 
  let 
    global = rec{
      system = "x86_64-linux";
      host = "nixos";
      user = "anower";
      fullName = "Anower Hossen";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    };
    system = "x86_64-linux";
    pkgs = global.pkgs;
  in
  {
    nixosConfigurations = {
      "${global.host}" = global.lib.nixosSystem {
        inherit system ;
        specialArgs = { inherit inputs global; };
        modules = [ 
        ./host/configuration.nix 
        home-manager.nixosModules.home-manager {
          home-manager = {
           useGlobalPkgs = true;
           useUserPackages = true;
           users.${global.user} = import ./home/home.nix { inherit inputs global; };
          };
         }
        ];
      };
    };
  };
}
