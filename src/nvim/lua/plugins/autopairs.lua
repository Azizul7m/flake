  return{
    "windwp/nvim-autopairs",
    dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({})
    end
  }
