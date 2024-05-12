{pkgs, ...}: {
  programs = with pkgs; [

    devbox
    direnv



    # C stuff
    clang
    llvm
    gcc
    cmake
    libclang
    libtool
    openssl
    pkg-config
    zlib
    libsodium
    gnupg
    binutils
    clang-tools
    gnumake

    #js
    nodejs
    deno   
    # rs
    rustup

    #py
    python310Packages.pip
    pipenv

    # bash
    shfmt
    # DevOps
    dockfmt # docker format
    podman-compose
  ];
}
