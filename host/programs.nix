{ config, pkgs, ... }:

with pkgs;

{
  environment.systemPackages = [
    ## ───────────────────────────────
    ## Core Development Tools
    ## ───────────────────────────────
    clang # C compiler
    lld # LLVM linker (lld)
    zlib # Often needed for linking
    gcc # C/C++ compiler (added for compilation support)
    libgcc # GCC runtime libraries (fixes missing Scrt1.o, crti.o)
    glibc # GNU C Library (fixes missing libc and related files)
    libclang # Needed for Rust/C FFI (e.g., bindgen)
    gnumake # Classic Make build system
    cmake # Cross-platform C/C++ project builder
    meson # Fast build system
    pkg-config # Metadata for compiling/linking
    openssl # Needed by many dev tools (e.g., Rust TLS)
    libtool # Portable library builder
    cpio # Extracts RPMs and initramfs
    systemd # For system libraries (not running daemon)
    ags # GJS library

    ## ───────────────────────────────
    ## Version Control & Signing
    ## ───────────────────────────────
    git # Main VCS
    gh # GitHub CLI
    subversion # SVN, rare but sometimes needed
    gnupg # Commit signing, SSH auth

    ## ───────────────────────────────
    ## Terminal Tools & Shell
    ## ───────────────────────────────
    xterm # Basic terminal (fallback)
    vim # Text editor
    wget # Simple downloader
    starship
    eza
    lsd
    bat
    grc

    ## ───────────────────────────────
    ## Terminal Utilities
    ## ───────────────────────────────
    htop
    tldr
    joshuto # Terminal file manager
    nitch # System fetch/status tool
    fd # Fast find
    ripgrep # Fast grep
    fzf # Fuzzy finder
    bat # `cat` with syntax highlighting
    tree # Directory tree viewer
    ncdu # Disk usage viewer
    gdb # Debugger
    killall # Kill processes by name

    ## ───────────────────────────────
    ## Networking & Remote Access
    ## ───────────────────────────────
    wrk
    sshfs # Mount remote FS via SSH
    nmap # Network scanner
    mtr # Network traceroute tool
    networkmanagerapplet # System tray Wi-Fi manager
    wayvnc # VNC for Wayland
    speechd # Text-to-speech daemon

    ## ───────────────────────────────
    ## Wayland Tools
    ## ───────────────────────────────
    wlprop # Inspect Wayland properties
    wlr-randr # RandR-like tool for wlroots
    wlroots_0_18 # Wayland base libraries
    wayland-protocols # Wayland protocols

    ## ───────────────────────────────
    ## USB & Device Utilities
    ## ───────────────────────────────
    libusb1 # USB access from user-space
    usbutils # List and inspect USB devices
    pciutils # Inspect PCI devices
    udisks2 # Mounting GUI backend

    ## ───────────────────────────────
    ## System Utilities (missing by default or enhanced)
    ## ───────────────────────────────
    home-manager # User-level config management
    unzip # Extract zip archives
    pulsemixer # Terminal audio control
    xdg-utils # Open files with default apps
    desktop-file-utils

    cups # Printing system
    fontconfig # System-wide font config (optional but often useful)
  ];

  ## ───────────────────────────────
  ## Theming
  ## ───────────────────────────────
  stylix.enable = true;

  ## ───────────────────────────────
  ## Programs and Services
  ## ───────────────────────────────
  programs = {
    dconf.enable = true; # GNOME settings backend (needed for many UIs)
    mtr.enable = true; # Enables `mtr` system-wide
    nm-applet.enable = true; # NetworkManager applet in tray
    fish.enable = true; # Fish shell support
    command-not-found.enable =
      true; # Suggest missing packages on command failure
    xwayland.enable = true; # Run X apps on Wayland
    hyprland.portalPackage =
      xdg-desktop-portal-hyprland; # Required for portal integration

    gnupg.agent = {
      enable = true; # GPG agent for signing
      enableSSHSupport = true; # Use GPG for SSH authentication
    };
  };
}
