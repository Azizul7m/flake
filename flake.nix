{
  description = "Personal NixOS and Home Manager configuration";

  # Add external projects here only when the configuration imports or uses
  # them below. After changing inputs, update the lock file with `nix flake lock`.
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      # These values describe the machine and user. Change all of them when
      # adapting this flake instead of editing the same value in many files.
      system = "x86_64-linux";
      host = "nixos";
      user = "anower";
      fullName = "Azizul Islam";
      userEmail = "azizul7m@gmail.com";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [ inputs.emacs-overlay.overlay ];
      };

    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              host
              user
              userEmail
              fullName
              inputs
              ;
          };
          modules = [
            ./host/configuration.nix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                # Home Manager renames conflicting dotfiles instead of
                # overwriting them during the first activation.
                backupFileExtension = "hm-backup";
                extraSpecialArgs = {
                  inherit
                    host
                    user
                    userEmail
                    fullName
                    inputs
                    ;
                };
                users."${user}" = import ./home/home.nix;
              };
            }
          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              host
              user
              userEmail
              fullName
              inputs
              ;
          };
          modules = [
            inputs.nixos-wsl.nixosModules.default
            ./host/wsl.nix
          ];
        };
      };
    };
}
