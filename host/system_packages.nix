{ pkgs, inputs, ... }:
with pkgs;
{
  environment.systemPackages = [
    inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default
    ## ───────────────────────────────
    ## Core Development Tools
    ## ───────────────────────────────

    cacert # SSL certificates
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
    libtool # Portable library builder
    cpio # Extracts RPMs and initramfs
    systemd # For system libraries (not running daemon)
    systemdUkify
    ags # GJS library

    browserpass
    pass-wayland
    passExtensions.pass-import
    passExtensions.pass-otp

    ## ───────────────────────────────
    ## Version Control & Signing
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
    bat
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
    ## Networking & Remote Access
    ## ───────────────────────────────
    iproute2 # Required for WinApps
    netcat # Required for WinApps
    wrk
    sshfs # Mount remote FS via SSH
    nmap # Network scanner
    mtr # Network traceroute tool
    openssl # SSL libraries
    openvpn # VPN client
    networkmanager-openvpn
    networkmanagerapplet # System tray Wi-Fi manager
    speechd # Text-to-speech daemon

    ## ───────────────────────────────
    ## Wayland Tools
    ## ───────────────────────────────
    wlprop # Inspect Wayland properties
    wlr-randr # RandR-like tool for wlroots
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
    tuigreet
    unzip # Extract zip archives
    pulsemixer # Terminal audio control
    xdg-utils # Open files with default apps
    desktop-file-utils

    cups # Printing system
    fontconfig # System-wide font config (optional but often useful)
  ];
}
