vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.hlsearch = true

vim.cmd([[highlight CurrentWord term=bold cterm=bold]])
vim.cmd([[highlight CurrentWordTwins term=underline cterm=underline gui=underline]])
vim.cmd([[highlight Search cterm=bold ctermfg=black ctermbg=LightGray]])
-- not working
vim.cmd([[highlight Normal ctermbg=NONE]])
