[
  {
    mode = "i";
    key = "jk";
    action = "<ESC>";
  }
  {
    mode = [ "x" "n" "t" ];
    key = "<leader>w";
    action = "<C-w>";
    options = { desc = "window management"; };
  }
  # Commentary bindings
  {
    mode = [ "v" "n" ];
    action = "<cmd>Commentary<CR>";
    key = "<M-;>";
    options = { desc = "Comments"; };
  }
  # Telescope bindings
  {
    mode = [ "n" "v" "i" "t"];
    action = "<cmd>Telescope<CR>";
    key = "<M-p>";
    options ={ desc = "Telescope"; };
  }
  {
    mode = [ "n" "v" ];
    action = "<cmd>Telescope live_grep<CR>";
    key = "<leader>fw";
    options = { desc = "Live grep"; };
  }
  {
    action = "<cmd>Telescope find_files<CR>";
    key = "<leader><space>";
  }
  {
    mode = [ "n" ];
    action = "<cmd>Telescope file_browser<CR>";
    key = "<leader>.";
    options = { desc = "Telescope File Browser"; };
  }
  {
    mode = [ "n" ];
    key = "<leader>g";
    action = "<cmd>Gitsigns<CR>";
    options = { desc = "Git"; };
  }
  {
    mode = "n";
    key = "<M-n>";
    action = "<cmd>Telescope diagnostics<cr>";
  }
  {
    mode = "n";
    key = "<leader>p";
    action = "<cmd>Telescope projects<cr>";
  }
  {
    mode = [ "i" "x" "n" "t" ];
    key = "<M-x>";
    action = "<cmd>Telescope commands<cr>";
  }
  {
    mode = [ "n" "t" ];
    key = "<M-j>";
    action = "<cmd>Telescope buffers<cr>";
  }
  {
    mode = "n";
    key = "K";
    action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    options = { desc = "lsp info"; };
  }
  {
    mode = "n";
    key = "<M-k>";
    action = "<cmd>lua vim.diagnostic.open_float()<CR>";
    options = { desc = "Show diagnostics under cursor"; };
  }
  {
    mode = [ "n" "v" ];
    key = "<C-a>";
    action = "<cmd>Lspsaga code_action<CR>";
    options = { desc = "lsp code action"; };
  }
  {
    mode = "n";
    key = "<M-n>";
    action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
    options = { desc = "Oil file browser"; };
  }
  {
    mode = "n";
    key = "<M-p>";
    action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
    options = { desc = "Oil file browser"; };
  }
  {
    mode = "n";
    key = "<leader>op";
    action = "<cmd>Oil<CR>";
    options = { desc = "Oil file browser"; };
  }
  {
    mode = "n";
    key = "<leader>tn";
    action = "<cmd>NvimTreeToggle<CR>";
    options = { desc = "File browser"; };
  }
  {
    mode = "n";
    key = "<leader>ot";
    action = "<cmd>terminal<CR>";
  }
]



