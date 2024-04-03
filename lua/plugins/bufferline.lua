return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({})
    vim.keymap.set("n", "<c-t>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<c-T>", ":BufferLineCyclePrev<CR>")
  end,
}
