{var, ...}: {
  home = {
    packages = (with var.pkgs; [
        devbox
        direnv
        # C STUFF

        gnumake
        cmake
        gnupg
        
        #JS
        nodejs
        deno   

        #RS

        #PY
        python310Packages.pip
        pipenv

        # BASH
        shfmt

        # NIX
        nixfmt-classic
        
        # DEVOPS
        dockfmt # docker format
        docker-compose
    ]) ++ (with var.pkgs-stable; [
     # rnix-lsp 
    ]);
  };
}
