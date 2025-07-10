{
  globalOpts = {
    # System clipboard support, needs xclip/wl-clipboard
    clipboard = {
      providers = {
        wl-copy.enable = true; # Wayland
        xsel.enable = true; # For X11
      };
      register = "unnamedplus";
    };
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    autoindent = true;
    backspace = "indent,eol,start";
    backup = true;
    cmdheight = 2;
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
    tabstop = 4;
    termguicolors = true;
    timeoutlen = 300;
    undofile = true;
    updatetime = 300;
    wrap = false;
    writebackup = true;

    # Set encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Save undo history
    swapfile = false;
    autoread = true;
    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;
    list = true;
    # Global substitution by default
    gdefault = true;
    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 5;
  };
}
