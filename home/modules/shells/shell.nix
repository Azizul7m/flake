{var, ...}: {
  home = {
    packages = (with var.pkgs; [
        devbox
        direnv
        # C stuff

        gnumake
        cmake
        gnupg
        
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

        #nix
        nixfmt
        
        # DevOps
        dockfmt # docker format
        docker-compose
    ]) ++ (with var.pkgs-stable; [
     # rnix-lsp 
    ]);
  };
}
