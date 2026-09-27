{ pkgs, inputs, ... }:
with pkgs;
{
  # Keep this list for tools needed across the whole system. GUI applications
  # and personal applications belong in home/packages.nix instead.
  environment.systemPackages = [
    ## ───────────────────────────────
    ## Compilers and build tools used by local development
    ## ───────────────────────────────

    clang # C compiler
    lld # LLVM linker (lld)
    gcc # C/C++ compiler (added for compilation support)
    libclang # Needed for Rust/C FFI (e.g., bindgen)
    gnumake # Classic Make build system
    cmake # Cross-platform C/C++ project builder
    meson # Fast build system
    pkg-config # Metadata for compiling/linking
    libtool # Portable library builder
    cpio # Extracts RPMs and initramfs
    ags # GJS library

    zbar # Scanner library for QR codes and barcodes
    browserpass # browser extension for password management
    pass-wayland # password
    passExtensions.pass-import #import passwords from other password managers
    passExtensions.pass-otp # otp support for pass
    passExtensions.pass-update # update pass entries from other password managers
    passExtensions.pass-genphrase # Generate passphrases for pass

    ## ───────────────────────────────
    ## Version control, signing, and password-store tools
    ## ───────────────────────────────
    git # Main VCS
    gh # GitHub CLI
    subversion # SVN, rare but sometimes needed
    gnupg # Commit signing, SSH auth
    paperkey # For recovering GPG keys from paper backups

    ## ───────────────────────────────
    ## Terminal Tools & Shell
    ## ───────────────────────────────
    xterm # Basic terminal (fallback)
    neovim
    wget # Simple downloader
    starship
    eza
    lsd
    grc
    bemenu

    ## ───────────────────────────────
    ## Terminal Utilities
    ## ───────────────────────────────
    htop
    tldr
    nitch # System fetch/status tool
    fd # Fast find
    ripgrep # Fast grep
    fzf # Fuzzy finder
    bat # `cat` with syntax highlighting
    tree # Directory tree viewer
    ncdu # Disk usage viewer
    gdb # Debugger
    killall # Kill processes by name
    khal # Terminal calendar
    cava # Audio visualizer
    fprintd # D-Bus interprocess communication bus
    polkit # Privilege management

    ### MOBILE DEVELOPMENT ###
    android-tools # ADB/fastboot
    adb-sync # File sync
    adbfs-rootless # FUSE filesystem

    ## ───────────────────────────────
    ## Networking, diagnostics, VPN, and remote access
    ## ───────────────────────────────
    iproute2 # Network interface and routing tools
    netcat # TCP/UDP connection utility
    wrk
    sshfs # Mount remote FS via SSH
    nmap # Network scanner
    mtr # Network traceroute tool
    openssl # SSL libraries
    openvpn # VPN client
    networkmanager-openvpn
    speechd # Text-to-speech daemon

    ## ───────────────────────────────
    ## Wayland Tools
    ## ───────────────────────────────
    wlprop # Inspect Wayland properties
    wlr-randr # RandR-like tool for wlroots

    ## ───────────────────────────────
    ## USB & Device Utilities
    ## ───────────────────────────────
    usbutils # List and inspect USB devices
    pciutils # Inspect PCI devices

    ## ───────────────────────────────
    ## System Utilities (missing by default or enhanced)
    ## ───────────────────────────────
    tuigreet
    unzip # Extract zip archives
    pulsemixer # Terminal audio control
    xdg-utils # Open files with default apps
    desktop-file-utils

    cups # Printing system
  ];
}
