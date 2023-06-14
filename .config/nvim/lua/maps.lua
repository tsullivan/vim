-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local diagnostic_opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, diagnostic_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, diagnostic_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, diagnostic_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, diagnostic_opts)

local telescope_builtin = require('telescope.builtin')
local telescope_ext = require('telescope').extensions
local telescope_opts = { noremap = true }
vim.keymap.set('n', '<leader>fo', telescope_builtin.oldfiles, telescope_opts)
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, telescope_opts)
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, telescope_opts)
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, telescope_opts)
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, telescope_opts)
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, telescope_opts)
vim.keymap.set("n", "<leader>fq", telescope_ext.file_browser.file_browser, telescope_opts)
vim.keymap.set("n", "<leader>fw", function () telescope_ext.file_browser.file_browser { path = "%:p:h" } end, telescope_opts)

-- Export an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local M = {}
function M.on_attach_lsp(bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
return M
