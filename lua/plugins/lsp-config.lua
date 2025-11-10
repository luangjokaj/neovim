return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("solargraph", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>cs", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
    end,
  },
}
