{ pkgs, inputs, ... }:

with pkgs;

{
  programs = {
    # System-wide program integration. User-facing configuration lives under
    # home/ and modules/programs/.
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
    # Keep this agent enabled for signing and password-store use. The SSH
    # support here allows GPG keys to authenticate SSH sessions.
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
    # OBS is enabled system-wide because the virtual camera needs kernel and
    # system integration; remove this block if recording/camera support is not
    # needed.
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
