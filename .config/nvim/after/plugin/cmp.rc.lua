local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then return end

local lspkind_ok, lspkind = pcall(require, "lspkind")

cmp.setup({
  -- nvim-cmp's preset.insert() provides good defaults for <C-n>, <C-p>, <C-Space>, <C-e>, <CR> (confirm selected),
  -- and <C-b>/<C-f> (scroll docs). Only add mappings here if you want to override defaults.
  mapping = cmp.mapping.preset.insert({
    -- Example for Tab/Shift-Tab navigation (requires a snippet engine like luasnip)
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then cmp.select_next_item()
    --   elseif lspkind_ok and require('luasnip').expand_or_jumpable() then require('luasnip').expand_or_jump()
    --   else fallback() end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then cmp.select_prev_item()
    --   elseif lspkind_ok and require('luasnip').jumpable(-1) then require('luasnip').jump(-1)
    --   else fallback() end
    -- end, { 'i', 's' }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP server suggestions
    { name = 'buffer' },   -- Words from current buffer
  }),

  -- Default window styles are bordered. Omit if satisfied with default.
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },

  formatting = lspkind_ok and {
    format = lspkind.cmp_format({
      -- Customize source labels in the completion menu.
      menu = {
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
      },
    }),
  } or nil,
})

-- Recommended Neovim options for completion popups.
vim.cmd [[set completeopt=menuone,noinsert,noselect,preview]]
