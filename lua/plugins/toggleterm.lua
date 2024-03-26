return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      autochdir = true,
    })
  end
}
