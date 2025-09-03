{ config, pkgs, user, ... }: {
  services = {
    
    pipewire = {
      # Sound settings
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    dbus.enable = true; # inter-process communication (IPC)
    libinput.enable = true; # LibInput
    getty.autologinUser = "${user}";
    devmon.enable = true; # monitoring drive "Heavy"
    lorri.enable = true;
    gvfs.enable = true; # trash  "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    languagetool.enable = true;
    blueman.enable = true;
    #  emacs = {
    #    enable = true;
    #    defaultEditor = true;
    #    startWithGraphical = true;
    #  };
    displayManager.gdm.enable = true;
    ollama = { enable = true; };
  };
}
