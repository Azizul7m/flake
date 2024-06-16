{var, ...}: {
  home = {
    
    packages = (with var.pkgs; [
        devbox
        direnv
        # C STUFF

        libclang
        gnumake
        cmake
        gnupg
        gcc
        pkg-config
        systemd        # Some core packages are bundle with systemd
        
        #JS
        nodejs
        deno   

        #RS

        #PY
        python310
        python310Packages.pip
        pipenv

        # BASH
        shfmt

        # NIX
        nixfmt-classic

        # Rust
        rustup

        
        # DEVOPS
        dockfmt # docker format
        docker-compose

        #utils
        starship 
        eza # ls alternative
        grc # text colored
        hunspell
        typioca
    ]) ++ (with var.pkgs-stable; [
     # rnix-lsp 
    ]);
    sessionVariables= {
      LIBCLANG_PATH = "${var.pkgs.libclang.lib}/lib";

    };
  };
}
