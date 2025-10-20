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
    options = { desc = "Window management"; };
  }
  {
    mode = [ "x" "n" "t" ];
    key = "<leader>b[";
    action = "<cmd>bprevious<CR>";
    options = { desc = "window management"; };
  }
  {
    mode = [ "x" "n" "t" ];
    key = "<leader>b]";
    action = "<cmd>bnext<CR>";
    options = { desc = "window management"; };
  }
  # Telescope bindings
  {
    mode = [ "n" "v" "i" "t" ];
    action = "<cmd>Telescope<CR>";
    key = "<M-p>";
    options = { desc = "Telescope"; };
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
  # LSP bindings
  {
    mode = "n";
    key = "gd";
    action = "<cmd>Lspsaga goto_definition<CR>";
    options.desc = "Go to definition";
  }
  {
    mode = "n";
    key = "<leader>cd";
    action = "<cmd>Lspsaga goto_definition<CR>";
    options.desc = "Go to definition";
  }
  {
    mode = "n";
    key = "gD";
    action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    options.desc = "Go to declaration";
  }
  {
    mode = "n";
    key = "gi";
    action = "<cmd>Lspsaga goto_implementation<CR>";
    options.desc = "Go to implementation";
  }
  {
    mode = "n";
    key = "<leader>cD";
    action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    options.desc = "Go to declaration";
  }
  {
    mode = "n";
    key = "leader>ci";
    action = "<cmd>Lspsaga goto_implementation<CR>";
    options.desc = "Go to implementation";
  }
  {
    mode = "n";
    key = "gr";
    action = "<cmd>Lspsaga lsp_finder<CR>";
    options.desc = "Show references";
  }
  {
    mode = "n";
    key = "<leader>cr";
    action = "<cmd>Lspsaga rename<CR>";
    options.desc = "Rename symbol";
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
    key = "<leader>ca";
    action = "<cmd>Lspsaga code_action<CR>";
    options = { desc = "lsp code action"; };
  }
  {
    mode = [ "n" "v" ];
    key = "<M-Enter>";
    action = "<cmd>Lspsaga code_action<CR>";
    options = { desc = "lsp code action"; };
  }
  {
    mode = "n";
    key = "-";
    action = "<cmd>Oil --float<CR>";
    options = { desc = "Open parent directory"; };
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
  # Obsidian
  {
    mode = "n";
    key = "<leader>noq";
    action = "<cmd>Obsidian quick_switch<CR>";
    options = { desc = "Obsidian: Quick switch"; };
  }
  {
    mode = "n";
    key = "<leader>nos";
    action = "<cmd>Obsidian search<CR>";
    options = { desc = "Obsidian: Search"; };
  }
  {
    mode = "n";
    key = "<leader>nof";
    action = "<cmd>Obsidian follow_link<CR>";
    options = { desc = "Obsidian: Follow link"; };
  }
  {
    mode = "n";
    key = "<leader>non";
    action = "<cmd>Obsidian new<CR>";
    options = { desc = "Obsidian: New note"; };
  }
  {
    mode = "n";
    key = "<leader>nol";
    action = "<cmd>Obsidian links<CR>";
    options = { desc = "Obsidian: Link"; };
  }
  {
    mode = "n";
    key = "<leader>not";
    action = "<cmd>Obsidian tags<CR>";
    options = { desc = "Obsidian: Tags"; };
  }
  {
    mode = "n";
    key = "<leader>nop";
    action = "<cmd>Obsidian open<CR>";
    options = { desc = "Obsidian: Open"; };
  }
  {
    mode = "n";
    key = "<leader>now";
    action = "<cmd>Obsidian workspace<CR>";
    options = { desc = "Obsidian: Workspace"; };
  }
]

