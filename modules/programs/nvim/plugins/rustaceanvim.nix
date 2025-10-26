{
  enable = true;
  # Tools / runnables/debuggables
  tools = {
    # integrated terminal executor that works well with toggleterm.nvim
    executor = "toggleterm";

    # Use neotest for interactive test runs (works well with neotest adapters)
    test_executor = "neotest";
    crate_test_executor = "neotest";

    # Leave cargo_override unset unless you must use a replacement like "cross"
    cargo_override = null;

    # Prefer nextest when available for faster, isolated test runs
    enable_nextest = true;

    # Enable clippy checks on save if clippy is available
    enable_clippy = true;

    # Keep automatic workspace reload from Cargo.toml (handy)
    reload_workspace_from_cargo_toml = true;

    # Replace builtin hover with the plugin hover actions (recommended UX)
    hover_actions = { replace_builtin_hover = true; };

    # Small cosmetic for grouped code actions
    code_actions = {
      group_icon = " ▶";
      ui_select_fallback = false;
    };

    # Floating window behaviour for hover & previews
    float_win_config = {
      auto_focus = false;
      open_split = "vertical";
    };

    # Crate graph: don't render external crates by default (local-first)
    crate_graph = {
      backend = "x11"; # change if you use a different graphviz backend
      full = false; # limit graph to workspace + local deps
      output = null; # leave unset (no file) unless you want artifacts
      pipe = null; # leave default shell pipe
    };

    # Keep default URL opener (or override with a lua function if you prefer)
    open_url = null;
  };

  # LSP server settings
  server = {
    # Try to auto-attach when rust-analyzer is present; can be boolean or function.
    auto_attach = true;

    # If you want to run custom on_attach logic, provide a Lua function here.
    # Leaving null uses plugin defaults.
    on_attach = null;

    # Explicit cmd is useful on systems where rust-analyzer is not on PATH,
    # or when you want a deterministic log path.
    cmd = [ "rust-analyzer" "--log-file" "/tmp/rust-analyzer.log" ];

    # Use plugin default settings loader (reads rust-analyzer.json if present).
    default_settings = null;

    # Standalone support is helpful for scratch files
    standalone = true;

    # Keep log file path deterministic; plugin default generates a temp name.
    logfile = "/tmp/rust-analyzer.log";

    # Don't auto-load VSCode settings by default (opt-in)
    load_vscode_settings = false;
  };

  # DAP (debugging) settings
  dap = {
    # Let rustaceanvim autoload configurations if adapters are available
    autoload_configurations = true;

    # Let the plugin detect and construct the adapter (codelldb / lldb)
    adapter = null;
  };
}
