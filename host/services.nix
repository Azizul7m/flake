{
  pkgs,
  user,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    tailscale
    remmina    # A user-friendly, graphical RDP/VNC client
    wol        # Keeps your wake-on-lan utility available
    freerdp    # FreeRDP is a free implementation of the Remote Desktop Protocol (RDP)
  ];
  services = {
    # Desktop integration services. GVFS/UDisks are used by Nautilus for
    # removable drives and trash; disabling them changes file-manager behavior.
    dbus.enable = true; # inter-process communication (IPC)
    gnome.gnome-keyring.enable = true; # Secret Service provider for apps such as Authenticator
    spice-vdagentd.enable = true;
    libinput.enable = true; # LibInput
    devmon.enable = true; # monitoring drive "Heavy"
    udev.packages = [ pkgs.libusbgx ];
    gvfs.enable = true; # trash "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    blueman.enable = true;
    fprintd.enable = true; # Fingerprint authentication
    openssh.enable = true; # SSH
    tailscale.enable= true; # remote access
    samba = {
      enable = true;
      openFirewall = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "security" = "user";
        };

        store_derive = {
          path = "/home/${user}/store_drive";
          "read only" = "no";
          "browseable" = "yes";
          "guest ok" = "no";
          "valid users" = user;
        };
      };
    };

    xrdp = {
        enable = true;
        openFirewall = true;
        defaultWindowManager = "hyprland";
      };

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
    # PipeWire provides the audio server for desktop applications and
    # Bluetooth audio. PulseAudio compatibility is enabled for older apps.

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
