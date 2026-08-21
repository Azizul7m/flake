{
  pkgs,
  user,
  ...
}:
{
  services = {
    getty.autologinUser = "${user}";
    dbus.enable = true; # inter-process communication (IPC)
    gnome.gnome-keyring.enable = true; # Secret Service provider for apps such as Authenticator
    spice-vdagentd.enable = true;
    libinput.enable = true; # LibInput
    devmon.enable = true; # monitoring drive "Heavy"
    udev.packages = [ pkgs.libusbgx ];
    gvfs.enable = true; # trash "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    blueman.enable = true;
    # ollama = {
    #   enable = true;
    # };
    # create_ap = { # wifi hotspot
    #   enable = true;
    #   settings = {
    #     INTERNET_IFACE = "eno1"; # Replace with your internet-connected interface (e.g., enp3s0)
    #     WIFI_IFACE = "wlp2s0"; # Replace with your Wi-Fi interface (e.g., wlp2s0)
    #     SSID = "MyNixOSHotspot";
    #     PASSPHRASE = "//112233";
    #   };
    # };
    # Sound settings

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true; # (Optional) Already enabled by default
        extraConfig = {
          "10-bluez" = {
            "monitor.bluez.properties" = {
            };
          };
        };
      };
    };
  };
}
