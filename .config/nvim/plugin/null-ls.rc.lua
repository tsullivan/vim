local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- you can reuse a shared lspconfig on_attach callback here
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

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
  on_attach = on_attach,
})
