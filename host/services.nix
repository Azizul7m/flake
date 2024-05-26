{config, pkg, ...}:
{
  services = {
    # xserver = {
    #   enable = true;
    #   xkb.layout = "us,bd";            # Configure keymap in X11
    #   xkb.variant = "";
    #   displayManager.lightdm.enable= false;
    #   # desktopManager.plasma5.enable = true;
    # };
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
      pulse.enable = true;
    };
    vsftpd = {
        enable = true;
    #   cannot chroot && write
    #   chrootlocalUser = true;
        writeEnable = true;
        localUsers = true;
        userlist = [ "anower" "cam" ];
        userlistEnable = true;
    };
    libinput.enable= true; #LibInput
    flatpak.enable = true;
    getty.autologinUser = "anower";
    openssh.enable = true;
    devmon.enable = true; # monitoring drive "Heavy"
    gvfs.enable = true;  # trash  "Heavy"
    udisks2.enable = true;  # auto mount drive  "Heavy"
  };
}
