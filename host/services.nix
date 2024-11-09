{ pkgs, var, ... }: {
  services = {
    pipewire = { # Sound settings
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    dbus.enable = true; # inter-process communication (IPC)
    libinput.enable = true; # LibInput
    getty.autologinUser = "${var.user}";
    devmon.enable = true; # monitoring drive "Heavy"
    gvfs.enable = true; # trash  "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    #flatpak.enable = true;
  };
}
