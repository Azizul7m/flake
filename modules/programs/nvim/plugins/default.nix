{
  # ─────────────────────────────
  # LSP / Completion (separate file)
  # ─────────────────────────────
  lsp = import ./lsp.nix;
  lspsaga.enable = true;            # LSP UI enhancements
  fidget.enable = true;             # LSP progress
  lspkind.enable = true;            # Completion pictograms

  trouble.enable = true;            # Diagnostics list

  #NOTE:Spasific language stuff
  #JavaScript/TypeScript
  typescript-tools.enable = true;    # TS utilities

  #Rust
  crates.enable = true;          # Show crate versions



  #NOTE: AI-assisted coding
  avante = {
    enable = true;
    settings = import ./avante.nix;
  };
  copilot-lua.enable = true;

  # Completion framework
  cmp = import ./cmp.nix;                     # Completion framework
  copilot-cmp.enable = true;                 # GitHub Copilot integration for completion
  cmp-nvim-lsp.enable = true;                # LSP source for nvim-cmp
  cmp-buffer.enable = true;                  # Buffer completion source
  cmp-path.enable = true;                    # File path completion source
  friendly-snippets.enable = true;           # Predefined snippets collection

  # ─────────────────────────────
  # UI / Aesthetics
  # ─────────────────────────────
  web-devicons.enable = true;       # Filetype icons
  which-key.enable = true;          # Keybinding hints
  neoscroll.enable = true;          # Smooth scrolling
  transparent.enable = true;        # Optional
  nvim-ufo.enable = true;           # Code folding
  wilder.enable = true;             # Command-line completion enhancements
  snacks = {
    enable = true;                  # Extra text objects
  };
  colorful-menu.enable= true;       # Enhanced popup menu with colors
  indent-blankline.enable = true;   # Indent guides

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
  treesitter = {
      enable = true;
      folding = true;
      settings.indent.enable = true;
  };
  treesitter-textobjects.enable = true;   # Text objects
  ts-autotag.enable = true;               # Auto close HTML/TSX tags
  ts-context-commentstring.enable = true; # Smarter commentstring
  treesitter-refactor.enable = true;      # Refactor features
  ts-comments.enable = true;

  # ─────────────────────────────
  # File Navigation
  # ─────────────────────────────
  telescope = import ./telescope.nix;
  oil.enable = true;                # File explorer
  nvim-tree.enable = true;         # File explorer alternative


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

