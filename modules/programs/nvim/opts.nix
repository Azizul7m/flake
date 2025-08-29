# opts.nix
{
  # System clipboard support, needs xclip/wl-clipboard
#  clipboard = {
#        # Use system clipboard
#        register = "unnamedplus";
#        providers.wl-copy.enable = true;
#  };
  number = true;
  relativenumber = false;
  shiftwidth = 2;
  tabstop = 2;
  autoindent = true;
  backspace = "indent,eol,start";
  cmdheight = 1;
  completeopt = "menu,menuone,noselect";
  conceallevel = 0;
  cursorline = true;
  expandtab = true;
  foldcolumn = "1";
  foldenable = true;
  foldlevel = 5;
  foldlevelstart = 99;
  ignorecase = true;
  laststatus = 3;
  mouse = "a";
  pumheight = 0;
  showtabline = 1;
  signcolumn = "yes";
  smartcase = true;
  termguicolors = true;
  timeoutlen = 300;

  # Save undo history
  undofile = true;
  swapfile = false;
  autoread = true;
  updatetime = 300;
  wrap = false;
  writebackup = true;

  # Set encoding
  encoding = "utf-8";
  fileencoding = "utf-8";

  # Configure how new splits should be opened
  splitright = true;
  splitbelow = true;
  list = true;
  # Global substitution by default
  gdefault = true;
  # Start scrolling when the cursor is X lines away from the top/bottom
  scrolloff = 5;
}

