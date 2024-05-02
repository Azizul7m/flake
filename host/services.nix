{config, pkg, ...}:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,bd";            # Configure keymap in X11
      xkb.variant = "";
      libinput.enable= true;
      displayManager.sddm.enable= true;
      desktopManager.plasma5.enable = true;
    };
    # create_ap = {
    #   enable = true;
    #   settings = {
    #     INTERNET_IFACE="eno1";
    #     PASSPHRASE="..11..aa";
    #     WIFI_IFACE="wlp2s0";
    #     SSID="NIXOS";
    #   };
    # };
    pipewire = { # Sound settings
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      # pulse.enable = true;
    };
    getty.autologinUser = "anower";
    openssh.enable = true;
    devmon.enable = true; # monitoring drive "Heavy"
    gvfs.enable = true;  # trash  "Heavy"
    udisks2.enable = true;  # auto mount drive  "Heavy"
  };
}
