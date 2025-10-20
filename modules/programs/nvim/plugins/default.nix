{
  # ─────────────────────────────
  # LSP / Completion (separate file)
  # ─────────────────────────────
  lsp = import ./lsp.nix;
  lspsaga.enable = true; # LSP UI enhancements
  lspkind.enable = true; # Completion pictograms
  trouble = import ./trouble.nix; # Diagnostics list
  fidget = import ./fidget.nix; # LSP status

  #Rust
  crates.enable = true; # Show crate versions

  #NOTE: AI-assisted coding
  avante = {
    enable = true;
    settings = import ./avante.nix;
  };
  copilot-lua.enable = true;

  # Completion framework
  cmp = import ./cmp.nix; # Completion framework
  copilot-cmp.enable = true; # GitHub Copilot integration for completion
  cmp-nvim-lsp.enable = true; # LSP source for nvim-cmp
  cmp-buffer.enable = true; # Buffer completion source
  cmp-path.enable = true; # File path completion source
  friendly-snippets.enable = true; # Predefined snippets collection

  # ─────────────────────────────
  # UI / Aesthetics
  # ─────────────────────────────
  lualine = import ./lualine.nix; # Statusline
  web-devicons.enable = true; # Filetype icons
  which-key.enable = true; # Keybinding hints
  neoscroll.enable = true; # Smooth scrolling
  transparent.enable = true; # Optional
  nvim-ufo.enable = true; # Code folding
  colorful-menu.enable = true; # Enhanced popup menu with colors
  alpha = import ./alpha.nix; # Start screen
  snacks = {
    enable = true; # Extra text objects
  };
  mini-icons = {
    enable = true;
    mockDevIcons = true;
  };
  indent-blankline = {
    enable = true; # Indent guides
    settings = { scope.enabled = false; };
  };
  # wilder = import ./wilder.nix;
  # ─────────────────────────────
  # Editing / Text Manipulation
  # ─────────────────────────────
  mini-pairs = {
    enable = true;
    settings = {
      modes = {
        command = true;
        insert = true;
        terminal = false;
      };
    };
  };
  nvim-surround.enable = true; # Easy surrounding chars
  sleuth.enable = true; # Detect indentation
  lastplace.enable = true; # Restore cursor position
  conform-nvim = import ./formater.nix; # Formater

  # ─────────────────────────────
  # Git / SCM
  # ─────────────────────────────
  fugitive.enable = true; # Git inside Neovim
  gitsigns.enable = true; # Git diff signs

  # ─────────────────────────────
  # Treesitter & Syntax
  # ─────────────────────────────
  treesitter = {
    enable = true;
    folding = true;
    settings.indent.enable = true;
  };
  treesitter-textobjects.enable = true; # Text objects
  ts-autotag.enable = true; # Auto close HTML/TSX tags
  ts-context-commentstring.enable = true; # Smarter commentstring
  treesitter-refactor.enable = true; # Refactor features
  ts-comments.enable = true;

  # ─────────────────────────────
  # File Navigation
  # ─────────────────────────────
  telescope = import ./telescope.nix;
  oil = import ./oil.nix; # File explorer
  nvim-tree.enable = true; # File explorer alternative

  # ─────────────────────────────
  # Project Management
  # ─────────────────────────────
  project-nvim.enableTelescope = true;

  # ─────────────────────────────
  # Misc Dev Tools
  # ─────────────────────────────
  direnv.enable = true; # Direnv integration
  nix.enable = true; # Nix syntax
  hmts.enable = true; # Tree-sitter for HCL/Nix
  helm.enable = true; # Helm charts
  typst-vim.enable = true; # Typst support
  markdown-preview.enable = true; # Live Markdown preview
  render-markdown.enable = true; # Render markdown inline
  helpview.enable = true; # Better help buffer
  comment = import ./comment.nix; # Commenting utility
  # ─────────────────────────────
  # Note-taking / Personal Knowledge Management
  # ─────────────────────────────
  obsidian = import ./obsidian.nix;
}

