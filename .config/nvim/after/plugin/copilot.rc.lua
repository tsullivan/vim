-- ~/.config/nvim/after/plugin/copilot.rc.lua

-- Disable default <Tab> mapping to avoid conflicts with nvim-cmp
vim.g.copilot_no_tab_map = true

-- Recommended mappings (adjust these to your preference)
-- This uses `<C-j>` to accept the suggestion
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Accept("\\<CR>")', { silent = true, expr = true, noremap = true })

-- Use `<C-n>` and `<C-p>` to cycle through suggestions
vim.api.nvim_set_keymap('i', '<C-n>', 'copilot#next()', { silent = true, expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', 'copilot#previous()', { silent = true, expr = true, noremap = true })

-- Dismiss the current suggestion with `<C-g>`
vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#dismiss()', { silent = true, expr = true, noremap = true })

-- Disable for specific filetypes:
vim.g.copilot_filetypes = {
  markdown = false,
  txt = false,
}
