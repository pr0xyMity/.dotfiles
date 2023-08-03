local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  
  local packer_bootstrap = ensure_packer()
  
  return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
  
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
     -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   use 'christoomey/vim-tmux-navigator'

   use {
       'nvim-telescope/telescope.nvim', tag = '0.1.2',
       -- or                            , branch = '0.1.x',
       requires = { { 'nvim-lua/plenary.nvim' } }
   }

   use { "catppuccin/nvim", as = "catppuccin" }

   use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

   use('nvim-lua/plenary.nvim')
   use('ThePrimeagen/harpoon')

   use('mbbill/undotree')

   use('neovim/nvim-lspconfig')
   use('jose-elias-alvarez/null-ls.nvim')
   use('MunifTanjim/prettier.nvim')

   use {
       'VonHeikemen/lsp-zero.nvim',
       branch = 'v2.x',
       requires = {
           -- LSP Support
           { 'neovim/nvim-lspconfig' }, -- Required
           {                            -- Optional
               'williamboman/mason.nvim',
               run = function()
                   pcall(vim.cmd, 'MasonUpdate')
               end,
           },
           { 'williamboman/mason-lspconfig.nvim' }, -- Optional

           -- Autocompletion
           { 'hrsh7th/nvim-cmp' },     -- Required
           { 'hrsh7th/cmp-nvim-lsp' }, -- Required
           { 'L3MON4D3/LuaSnip' },     -- Required
       }
   }


   use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

   use('nvim-lua/plenary.nvim')
   use('ThePrimeagen/harpoon')

   use('mbbill/undotree')

   use('neovim/nvim-lspconfig')
   use('jose-elias-alvarez/null-ls.nvim')
   use('MunifTanjim/prettier.nvim')

   use({
   "kdheepak/lazygit.nvim",
   -- optional for floating window border decoration
   requires = {
       "nvim-lua/plenary.nvim",
   },
})

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
