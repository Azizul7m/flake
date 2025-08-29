{
enable = true;
keymaps = {
  silent = true;
  diagnostic = {
    # Navigate in diagnostics
    "<M-n>" = "goto_prev";
    "<M-p>" = "goto_next";
  };

  lspBuf = {
    gd = "definition";
    gD = "references";
    gt = "type_definition";
    gi = "implementation";
    K = "hover";
    re = "rename";
  };
};
servers = {
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
  tailwindcss.enable = true;
  eslint.enable = true;
  ts_ls = {
    enable = true;
    filetypes = [
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
      ];
      extraOptions = {
        settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
        };
      };
  };

  # DevOps / Infra
  #earthlyls.enable = true;
 # terraformls.enable = true;
  helm_ls = {
    enable = true;
    filetypes = [ "helm" ];
  };

  # Go
 # gopls.enable = true;
 # golangci_lint_ls.enable = true;

 # Python
 # pylsp.enable = true;

  # Others
  ccls.enable = true; # C/C++
  nushell.enable = true; # Nushell
};
}
