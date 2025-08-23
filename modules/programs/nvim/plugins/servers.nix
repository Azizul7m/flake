{
  # General
  bashls.enable = true;
  dockerls.enable = true;
  jsonls.enable = true;
  lua_ls.enable = true;
  nixd = {
    enable = true;
    settings = {
      formatting.command = [ "nixpkgs-fmt" ];
      nixpkgs.expr = "import <nixpkgs> {}";
    };
  };

  # Web
  cssls.enable = true;
  emmet_ls.enable = true;
  html.enable = true;
  superhtml.enable = true;
  tailwindcss.enable = true;

  # DevOps / Infra
  ansiblels.enable = true;
  earthlyls.enable = true;
  terraformls.enable = true;
  helm_ls = {
    enable = true;
    filetypes = [ "helm" ];
  };

  # Go
  gopls.enable = true;
  golangci_lint_ls.enable = true;

  # Python
  pylsp.enable = true;

  # Others
  ccls.enable = true; # C/C++
  nushell.enable = true; # Nushell
  veryl_ls.enable = true; # Veryl HDL
}

