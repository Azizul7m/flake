{
  config,
  pkgs,
  user,
  ...
}:
{
  services = {
    getty.autologinUser = "${user}";
    # greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --sessions /run/current-system/sw/share/wayland-sessions";
    #       user = "greeter";
    #     };
    #   };
    # };
    dbus.enable = true; # inter-process communication (IPC)
    spice-vdagentd.enable = true;
    libinput.enable = true; # LibInput
    devmon.enable = true; # monitoring drive "Heavy"
    gvfs.enable = true; # trash "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    ollama = {
      enable = true;
    };
    blueman.enable = true;
    # displayManager.gdm.enable = true;
    #  emacs = {
    #    enable = true;
    #    defaultEditor = true;
    #    startWithGraphical = true;
    #  };
    pipewire = {
      # Sound settings
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true; # (Optional) Already enabled by default
        extraConfig = {
          "10-bluez" = {
            "monitor.bluez.properties" = {
              # "bluez5.enable-sbc-xq" = true;
              # "bluez5.enable-msbc" = true;
              # "bluez5.enable-hw-volume" = true;
              # "bluez5.roles" = [ "hsp_ag" "hfp_ag" ];
              # "bluez5.hfphsp-backend" = "native";
              # "bluez5.autoswitch-profile" = true;
            };
          };
        };
      };
    };
  };
}
