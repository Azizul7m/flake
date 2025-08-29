{
  enable = true;
  autoEnableSources = false;
  settings = {
    sources = [
      { name = "nvim_lsp"; }
      { name = "copilot"; }
      { name = "git"; }
      {
        name = "path"; # file system paths
        keywordLength = 3;
      }
      {
        name = "luasnip"; # snippets
        keywordLength = 3;
      }
      { name = "emoji"; }
      {
        name = "buffer"; # text within current buffer
        option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        keywordLength = 3;
      }
    ];
    window = {
      completion = { border = "solid"; };
      documentation = { border = "solid"; };
    };
    mapping = {
      "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i'})";

      "<Up>" =  "cmp.mapping(cmp.mapping.select_prev_item(), {'i'})";
      "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";


      "<C-CR>" = "cmp.mapping(cmp.mapping.complete(), {'i'})";
      "<M-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i'})";
      "<M-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i'})";
      "<M-e>" = "cmp.mapping(cmp.mapping.abort(), {'i'})";
      "<S-M-k>" = "cmp.mapping.scroll_docs(-4)";
      "<S-M-j>" = "cmp.mapping.scroll_docs(4)";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "<S-CR>" =
        "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
    };
  };
}
