local keymap = vim.keymap
local telescope_builtin = require('telescope.builtin')
local telescope_ext = require('telescope').extensions

local opts = { noremap = true }

keymap.set('n', '<leader>ff', telescope_builtin.find_files, opts)
keymap.set('n', '<leader>fg', telescope_builtin.live_grep, opts)
keymap.set('n', '<leader>fb', telescope_builtin.buffers, opts)
keymap.set('n', '<leader>fh', telescope_builtin.help_tags, opts)
keymap.set("n", "<space>fb", telescope_ext.file_browser.file_browser, opts)
