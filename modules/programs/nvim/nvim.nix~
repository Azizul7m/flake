{ inputs, pkgs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    keymaps = [
      {
        mode = [ "x" "n" "t" ];
        key = "<leader>w";
        action = "<C-w>";
      }
      # Commentary bindings
      {
        action = "<cmd>Commentary<CR>";
        key = "<M-/>";
      }
      # Telescope bindings
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader><space>";
      }
      {
        action = "<cmd>Telescope file_browser<CR>";
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
        key = "<leader>o-";
        action = "<cmd>Oil<CR>";
      }
      {
        mode = "n";
        key = "<leader>tn";
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>ot";
        action = "<cmd>terminal<CR>";
      }
      {
        mode = [ "i" "x" "n" "t" ];
        key = "<M-x>";
        action = ":";
      }
      {
        mode = "i";
        key = "jk";
        action = "<esc>";
      }
    ];

    plugins = {
      dashboard.enable = true;
      transparent.enable = true;
      nvim-autopairs.enable = true;
      none-ls.enable = true;
      nvim-surround.enable = true;
      bacon.enable = true;
      commentary.enable = true;
      direnv.enable = true;
      earthly.enable = true;
      fidget.enable = true;
      friendly-snippets.enable = true;
      fugitive.enable = true;
      gitignore.enable = true;
      gitsigns.enable = true;
      hardtime.enable = false;
      helm.enable = true;
      helpview.enable = true;
      hmts.enable = true;
      lastplace.enable = true;
      markdown-preview.enable = true;
      molten.enable = true;
      navic.enable = true;
      nix.enable = true;
      numbertoggle.enable = true;
      nvim-ufo.enable = true;
      rainbow-delimiters.enable = true;
      render-markdown.enable = true;
      sleuth.enable = true;
      smear-cursor.enable = true;
      specs.enable = false;
      tmux-navigator.enable = true;
      treesitter.enable = true;
      treesitter-refactor.enable = true;
      treesitter-textobjects.enable = true;
      ts-autotag.enable = true;
      ts-context-commentstring.enable = true;
      typst-vim.enable = true;
      vim-be-good.enable = true;
      vim-css-color.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
      wilder.enable = true;
      wrapping.enable = true;
      zig.enable = true;
      neo-tree.enable = true;
      blink-ripgrep = {
        enable = true;
        autoLoad = true;
      };
      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          fzy-native.enable = true;
          ui-select.enable = true;
          frecency = {
            enable = true;
            settings = { db_safe_mode = false; };
          };
        };
      };
      oil = {
        enable = true;
        settings = {
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;
          default_file_explorer = true;
          use_default_keymaps = true;
          keymaps = {
            "g?" = "actions.show_help";
            "<CR>" = "actions.select";
            "-" = "actions.parent";
            "_" = "actions.open_cwd";
            "`" = "actions.cd";
            "~" = "actions.tcd";
            "g." = "actions.toggle_hidden";
          };
          view_options = { show_hidden = true; };
          win_options = { signcolumn = "yes:2"; };
        };
      };
      cmp-cmdline.enable = true;
      cmp-dap.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          sources = [
            { name = "git"; }
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            { name = "copilot"; }
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];
          window = {
            completion = { border = "solid"; };
            documentation = { border = "solid"; };
          };
          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-CR>" = "cmp.mapping(cmp.mapping.complete(), {'i'})";
            "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i'})";
            "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i'})";
            "<C-e>" = "cmp.mapping(cmp.mapping.abort(), {'i'})";
            "<M-k>" = "cmp.mapping.scroll_docs(-4)";
            "<M-j>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" =
              "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
      lazydev.enable = true;
      lspkind.enable = true;
      lspsaga.enable = true;
      lsp-format.enable = true;
      lz-n = { enable = true; };
      rustaceanvim.enable = true; # Rust development tools
      neoscroll.enable = true;

      crates = {
        enable = true;
        settings = {
          autoload = true;
          autoupdate = true;
          smart_insert = true;
          thousands_separator = ",";
          completion = { cmp = { enabled = true; }; };
        };
      };
      lsp = {
        enable = true;
        servers = {
          ansiblels.enable = true;
          bashls.enable = true;
          ccls.enable = true;
          cssls.enable = true;
          dockerls.enable = true;
          earthlyls.enable = true;
          emmet_ls.enable = true;
          golangci_lint_ls.enable = true;
          gopls.enable = true;
          html.enable = true;
          java_language_server.enable = false;
          jdtls.enable = false;
          jsonls.enable = true;
          lua_ls.enable = true;
          nushell.enable = true;
          pylsp.enable = true;
          pylyzer.enable = false;
          ruff_lsp.enable = false;
          superhtml.enable = true;
          tailwindcss.enable = true;
          terraformls.enable = true;
          ts_ls.enable = true;
          veryl_ls.enable = true;
          zls.enable = false;
          helm_ls = {
            enable = true;
            filetypes = [ "helm" ];
          };
          nixd = {
            enable = true;
            settings = {
              formatting.command = [ "nixpkgs-fmt" ];
              nixpkgs.expr = "import <nixpkgs> {}";
            };
          };
        };
      };
      project-nvim = {
        enable = true;
        enableTelescope = true;
        settings = {
          manual_mode = true;
          patterns = [
            ".bzr"
            ".git"
            ".hg"
            ".svn"
            "Cargo.toml"
            "Makefile"
            "_darcs"
            "flake.nix"
            "flake.nix"
            "go.mod"
            "package.json"
            "pom.xml"
          ];
        };
      };
    };

    colorschemes.catppuccin.enable = true;
    globals.mapleader = " "; # Sets the leader key to comma
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
    };
  };
}
