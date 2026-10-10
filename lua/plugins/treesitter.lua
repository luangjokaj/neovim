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

    -- Neovim 0.13 dropped the `all = false` query handler option, so captures
    -- now always arrive as TSNode lists. The frozen `master` predicates
    -- (set-lang-from-info-string!, downcase!, ...) still expect a single
    -- node and crash the highlighter. Re-register them with lists unwrapped.
    local query = require("vim.treesitter.query")
    local add_predicate, add_directive = query.add_predicate, query.add_directive
    local function unwrap(handler)
      return function(match, ...)
        local nodes = {}
        for id, capture in pairs(match) do
          nodes[id] = type(capture) == "table" and capture[#capture] or capture
        end
        return handler(nodes, ...)
      end
    end
    query.add_predicate = function(name, handler, opts)
      add_predicate(name, unwrap(handler), opts)
    end
    query.add_directive = function(name, handler, opts)
      add_directive(name, unwrap(handler), opts)
    end
    package.loaded["nvim-treesitter.query_predicates"] = nil
    require("nvim-treesitter.query_predicates")
    query.add_predicate, query.add_directive = add_predicate, add_directive
  end,
}
