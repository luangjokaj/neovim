return {
  "nvim-treesitter/nvim-treesitter",
  -- Upstream flipped its default branch to `main`, a full rewrite that needs
  -- the tree-sitter CLI (>= 0.26.1) to compile parsers. Every prebuilt 0.26.x
  -- Linux binary requires GLIBC 2.39 and this box has 2.35, so pin `master`,
  -- which compiles with plain `cc`.
  branch = "master",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
