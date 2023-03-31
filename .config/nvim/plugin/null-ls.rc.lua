local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.diagnostics.eslint.with({
    filter = function(diagnostic)
      -- ignore weird error
      return diagnostic.code ~= "import/no-extraneous-dependencies"
    end,
  }),
  null_ls.builtins.formatting.prettier,
}


null_ls.setup({
  sources = sources,
})
