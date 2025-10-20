-- Modern diagnostic config (no deprecated sign_define)
vim.diagnostic.config({
  virtual_text = {
    prefix = "󰅚", -- Icon for inline text
    spacing = 2,
    source = "if_many",
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
  signs = {
    -- Define sign icons here instead of sign_define()
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "󰌶",
    },
  },
})

-- Show diagnostic popup on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Enable Rust analyzer inlay hints automatically
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "rust_analyzer" and vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
