local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  use 'norcalli/nvim-colorizer.lua'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'dahu/SearchParty'
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'

  use 'ruanyl/vim-gh-line'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-fugitive'
  use 'Yggdroot/vim-mark'
  use 'tpope/vim-unimpaired'
  use 'jremmen/vim-ripgrep'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-sensible'
  use 'diepm/vim-rest-console'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'gpanders/vim-oldfiles'

  use 'NLKNguyen/papercolor-theme'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
end)
