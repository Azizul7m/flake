{
  user,
  inputs,
  config,
  ...
}:
{
  # Home Manager imports are grouped by purpose. Add a new personal program
  # to modules/programs/default.nix rather than making this list longer.
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./xdg.nix
    ./gtk.nix
    ./packages.nix
    ./session_variables.nix
    ../modules/programs
    ../modules/shells
    ../modules/services
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    # Keep this at the version used when Home Manager was first enabled.
    stateVersion = "23.05";
  };

  catppuccin = {
    autoEnable = true;
    flavor = "mocha";
  };

  #  gtk = { enable = true; };
  programs = {
    home-manager.enable = true;
    gitui.enable = true;
    diff-highlight.enable = true;
  };
  # User services start in the session and are independent of system services.
  services = {
    lorri = {
      enable = true;
      enableNotifications = true;
    };
    syncthing = {
      enable = true;
    }; # Enable Syncthing service
    kdeconnect = {
      enable = true; # Enable KDE Connect service
      indicator = true;
    };
    emacs = {
      enable = true;
      client.enable = true;
      defaultEditor = false;
      socketActivation.enable = true;
    };
  };

}
