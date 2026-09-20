{ pkgs, inputs, ... }:

with pkgs;

{
  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
      ];
    };
    dconf.enable = true; # GNOME settings backend (needed for many UIs)
    mtr.enable = true; # Enables `mtr` system-wide
    nm-applet.enable = true; # NetworkManager applet in tray
    fish.enable = true; # Fish shell support
    command-not-found.enable = true; # Suggest missing packages on command failure
    xwayland.enable = true; # Run X apps on Wayland
    hyprland = {
      enable = true;
      portalPackage = xdg-desktop-portal-hyprland; # Required for portal integration
    };
    #   niri.enable = true;
    gnupg.agent = {
      enable = true; # GPG agent for signing
      enableSSHSupport = true; # Use GPG for SSH authentication
      pinentryPackage = pkgs.pinentry-gnome3;

      # pinentryPackage = pkgs.pinentry-gnome3;

      # # Crucial: Use a graphical popup that works seamlessly in Wayland/Hyprland
      # pinentryPackage = pkgs.pinentry-qt;
      # pinentryFlavor = "qt";
      settings = {
        default-cache-ttl = 28800;
        max-cache-ttl = 28800;
      };
    };
    openvpn3 = {
      enable = true;
    };
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        input-overlay
        wlrobs
        waveform
        droidcam-obs
        obs-backgroundremoval
        obs-composite-blur
      ];
    };
  };
}
