{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = [ "x" "n" "v" ];
      action = "<cmd>C-w<CR>";
      key = "<leader>w";
    }
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
    }
    # Commentary bindings
    {
      action = "<cmd>Commentary<CR>";
      key = "<leader>/";
    }
    # Telescope bindings
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fw";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>.";
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<leader>fg";
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
    }
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Oil<CR>";
    }
    {
      mode = [ "i" "v" "n" ];
      key = "M-x";
      action = ":";
    }
  ];
}
