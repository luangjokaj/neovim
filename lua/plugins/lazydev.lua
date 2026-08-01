return {
  -- feeds lua_ls the type definitions of plugins used in this config, so
  -- annotations like `---@type snacks.Config` and globals like `Snacks`
  -- resolve instead of being reported as undefined
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "snacks.nvim", words = { "Snacks", "snacks%." } },
    },
  },
}
