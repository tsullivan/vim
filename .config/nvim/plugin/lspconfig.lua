local on_attach_lsp = require('maps').on_attach_lsp

-- Safely require lspconfig
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then return end

-- Common on_attach function for all LSP servers
local on_attach = function(client, bufnr)
  -- Enable omnifunc completion
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Set up user mappings (from your maps module)
  on_attach_lsp(bufnr)

  -- TypeScript: Register OrganizeImports command
  if client.name == "tsserver" or client.name == "ts_ls" then
    vim.api.nvim_buf_create_user_command(bufnr, "OrganizeImports", function()
      vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      })
    end, { desc = "Organize Imports using TypeScript LSP" })
  end
end

-- LSP flags and capabilities
local lsp_flags = { debounce_text_changes = 150 }
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript/JavaScript LSP setup
nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  flags = lsp_flags,
}

-- Python LSP setup
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
}

-- Lua LSP setup (for Neovim config/dev)
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Neovim runtime
        checkThirdParty = false,
      },
    },
  },
}
