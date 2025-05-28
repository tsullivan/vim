-- ~/.config/nvim/after/plugin/copilot.rc.lua

-- Disable default <Tab> mapping to avoid conflicts with nvim-cmp
vim.g.copilot_no_tab_map = true

-- Recommended mappings (adjust these to your preference)
-- This uses `<C-j>` to accept the suggestion
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("\\<CR>")', { silent = true, expr = true, noremap = true })

-- Cycle suggestions with <C-l> and <C-h> (instead of <C-n>/<C-p>)
vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Next()', { silent = true, expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', 'copilot#Previous()', { silent = true, expr = true, noremap = true })

-- Dismiss suggestion
vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#Dismiss()', { silent = true, expr = true, noremap = true })

-- Disable for specific filetypes:
vim.g.copilot_filetypes = {
  markdown = false,
  txt = false,
}
