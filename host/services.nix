{ config, pkgs, user, ... }: {
  services = {
    getty.autologinUser = "${user}";
    dbus.enable = true; # inter-process communication (IPC)
    libinput.enable = true; # LibInput
    devmon.enable = true; # monitoring drive "Heavy"
    gvfs.enable = true; # trash "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    ollama = { enable = true; };
    #languagetool.enable = true;
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
      wireplumber.enable = true; # (Optional) Already enabled by default
    };
  };
}
