return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({})
    vim.keymap.set("n", "<c-o>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<c-i>", ":BufferLineCyclePrev<CR>")
  end,
}
