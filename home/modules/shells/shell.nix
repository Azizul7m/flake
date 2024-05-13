{pkgs, ...}: {
  home = {
    packages = with pkgs; [
        devbox
        direnv
        # C stuff
        clang
        llvm
        cmake
        libclang
        libtool
        openssl
        pkg-config
        libsodium
        gnupg
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
  };
}
