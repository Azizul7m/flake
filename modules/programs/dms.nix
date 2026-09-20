{
  inputs,
  pkgs,
  user,
  ...
}:
{
  imports = [ inputs.dms.nixosModules.dank-material-shell ];

  programs = {
    dms-shell = {
      enable = true;
      systemd.enable = false;
      package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;

      enableSystemMonitoring = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
    };

    dsearch = {
      enable = true;
      systemd.enable = true;
    };
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "hyprland";
  };

  security.pam = {
    services.login = {
      enableGnomeKeyring = true;
      u2fAuth = true;
    };
    services.sudo.fprintAuth = true;
    services.greetd.u2fAuth = true;
    u2f = {
      enable = true;
      control = "sufficient";
      settings = {
        cue = true;
        interactive = true;
      };
    };
  };

  environment.systemPackages = [
    inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home-manager.users.${user}.systemd.user.services.dms-inhibit = {
    Unit = {
      Description = "Hold sleep inhibitor while quickshell DMS runs";
    };
    Service = {
      ExecStart = ''
        /run/current-system/sw/bin/systemd-inhibit --what=sleep --why="DMS active" --mode=block \
        /bin/sh -c "while /run/current-system/sw/bin/pgrep -u ${user} quickshell >/dev/null; do sleep 5; done"
      '';
      Restart = "no";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
