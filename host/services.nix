{
  config,
  pkgs,
  user,
  ...
}:
{
  services = {
    getty.autologinUser = "${user}";
    dbus.enable = true; # inter-process communication (IPC)
    spice-vdagentd.enable = true;
    libinput.enable = true; # LibInput
    devmon.enable = true; # monitoring drive "Heavy"
    udev.packages = [ pkgs.libusbgx ];
    gvfs.enable = true; # trash "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    ollama = {
      enable = true;
    };
    blueman.enable = true;
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
