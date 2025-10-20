{
  enable = true;

  keymaps = {
    diagnostic = {
      "<M-p>" = "goto_prev";
      "<M-n>" = "goto_next";
    };
  };

  servers = {
    # ----------------
    # General
    # ----------------
    dockerls.enable = true;
    lua_ls = {
      enable = true;
      settings = {
        Lua = {
          diagnostics = { globals = [ "vim" ]; };
          workspace = { checkThirdParty = false; };
          telemetry = { enable = false; };

          completion =

            {
              callSnippet = "Replace";
            };
          hint = { enable = true; };
        };
      };
    };
    nixd = {
      enable = true;
      settings = { formatting.command = [ "nixfmt" ]; };
    };

    # ----------------
    # Web
    # ----------------
    cssls.enable = true;
    emmet_ls.enable = true;
    html.enable = true;
    tailwindcss.enable = true;
    eslint.enable = true;

    ts_ls = {
      enable = true;
      filetypes =
        [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];
      extraOptions = {
        settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
            };
          };
        };
      };
    };

    # ----------------
    # Python
    # ----------------
    pylsp = {
      enable = true;
      settings = {
        pylsp = {
          plugins = {
            pycodestyle.enabled = false; # use ruff instead
            pylint.enabled = false;
            flake8.enabled = false;
            mccabe.enabled = false;
            yapf.enabled = false;
            rope_completion.enabled = true;
          };
        };
      };
    };

    # ----------------
    # Rust
    # ----------------
    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      settings = {
        cargo = {
          allFeatures = true;
          autoreload = true;
        };
        check = {
          command = "clippy"; # Better lints than just `check`
          extraArgs = [ "--message-format=json" ];
        };
        procMacro.enable = true;
        diagnostics = {
          enable = true;
          experimental = { enable = true; };
        };
        inlayHints = {
          enable = true;
          parameterHints = { enable = true; };
          typeHints = { enable = true; };
          chainingHints = { enable = true; };
          maxLength = 25;
        };
        completion = {
          addCallArgumentSnippets = true;
          addCallParenthesis = true;
        };
        rustfmt = { overrideCommand = [ "rustfmt" "--edition" "2021" ]; };
      };
    };

    # ----------------
    # Others
    # ----------------
    ccls.enable = true; # C/C++
    nushell.enable = true; # Nushell
  };
}

