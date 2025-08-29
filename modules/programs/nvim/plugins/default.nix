{
  # ─────────────────────────────
  # LSP / Completion (separate file)
  # ─────────────────────────────
  lsp = import ./lsp.nix;
  lspsaga.enable = true;            # LSP UI enhancements
  fidget.enable = true;             # LSP progress
  lspkind.enable = true;            # Completion pictograms


  avante = {
    enable = true;
    settings = import ./avante.nix;
  };
  copilot-lua.enable = true;

  # Completion framework
  cmp = import ./cmp.nix;
  copilot-cmp.enable = true;
  cmp-nvim-lsp.enable = true;
  cmp-buffer.enable = true;
  cmp-path.enable = true;
  friendly-snippets.enable = true;  # Snippets

  # ─────────────────────────────
  # UI / Aesthetics
  # ─────────────────────────────
  dashboard.enable = true;          # Start screen
  web-devicons.enable = true;       # Filetype icons
  which-key.enable = true;          # Keybinding hints
  neoscroll.enable = true;          # Smooth scrolling
  transparent.enable = true;        # Optional
  nvim-ufo.enable = true;           # Code folding
  wilder.enable = true;
  snacks.enable = true;
  colorful-menu.enable= true;

  # ─────────────────────────────
  # Editing / Text Manipulation
  # ─────────────────────────────
  nvim-autopairs.enable = true;     # Auto close pairs
  nvim-surround.enable = true;      # Easy surrounding chars
  commentary.enable = true;         # Comment toggling
  sleuth.enable = true;             # Detect indentation
  lastplace.enable = true;          # Restore cursor position

  # ─────────────────────────────
  # Git / SCM
  # ─────────────────────────────
  fugitive.enable = true;           # Git inside Neovim
  gitsigns.enable = true;           # Git diff signs

  # ─────────────────────────────
  # Treesitter & Syntax
  # ─────────────────────────────
  treesitter.enable = true;               # Core syntax highlighting
  treesitter-textobjects.enable = true;   # Text objects
  ts-autotag.enable = true;               # Auto close HTML/TSX tags
  ts-context-commentstring.enable = true; # Smarter commentstring
  treesitter-refactor.enable = true;      # Refactor features

  # ─────────────────────────────
  # File Navigation
  # ─────────────────────────────
  telescope = import ./telescope.nix;
  oil.enable = true;                # File explorer

  # ─────────────────────────────
  # Project Management
  # ─────────────────────────────
  project-nvim.enable = true;       # Project root detection
  project-nvim.enableTelescope = true;

    # ─────────────────────────────
  # Misc Dev Tools
  # ─────────────────────────────
  direnv.enable = true;             # Direnv integration
  earthly.enable = true;            # Earthly build system
  nix.enable = true;                # Nix syntax
  hmts.enable = true;               # Tree-sitter for HCL/Nix
  helm.enable = true;               # Helm charts
  typst-vim.enable = true;          # Typst support
  markdown-preview.enable = true;   # Live Markdown preview
  render-markdown.enable = true;    # Render markdown inline
  helpview.enable = true;           # Better help buffer
}

