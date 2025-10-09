
{
  enable = true;
  settings = {
    format_on_save = {
      lsp_fallback = true;
      timeout_ms = 500;
    };
    formatters_by_ft = {
      nix = [ "nixfmt" ];
        rust = [ "rustfmt" ];
        javascript = [ "prettierd" "prettier" ];
        typescript = [ "prettierd" "prettier" ];
        json = [ "prettierd" "prettier" ];
        html = [ "prettier" ];
        css = [ "prettier" ];
        python = [ "black" ];
        lua = [ "stylua" ];
    };
  };
}
