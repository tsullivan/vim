local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'norcalli/nvim-colorizer.lua'

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } } }

  use 'christoomey/vim-tmux-navigator'
  use 'akinsho/nvim-bufferline.lua'

  use 'ruanyl/vim-gh-line'
  use 'editorconfig/editorconfig-vim'
  use 'dominikduda/vim_current_word'
  use 'tpope/vim-fugitive'
  use 'jremmen/vim-ripgrep'
  use 'Yggdroot/vim-mark'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-sensible'
  use 'diepm/vim-rest-console'

  use 'NLKNguyen/papercolor-theme'
end)
