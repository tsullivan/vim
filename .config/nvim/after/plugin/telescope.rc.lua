require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    }
  }
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

local telescope_builtin = require('telescope.builtin')
local telescope_ext = require('telescope').extensions

local opts = { noremap = true }

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, opts)
vim.keymap.set("n", "<space>fb", telescope_ext.file_browser.file_browser, opts)
