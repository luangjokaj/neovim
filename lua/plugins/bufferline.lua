return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({})
    vim.keymap.set("n", "<M-o>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<M-i>", ":BufferLineCyclePrev<CR>")
  end,
}
