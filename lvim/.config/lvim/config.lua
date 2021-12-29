--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- Plugins / Plug
lvim.plugins = {
  {
    "kdheepak/lazygit.nvim", 
    cmd = "LazyGit",
  },
  {"numToStr/FTerm.nvim"}, 
  {"kevinhwang91/rnvimr"},
  {"phaazon/hop.nvim"},
  {
    "prettier/vim-prettier",
    run = 'yarn install',
  },
  {"tpope/vim-surround"}
}



-- Leader key
vim.g.mapleader = ' '

-- Telescope
lvim.builtin.telescope.defaults.initial_mode = "insert"

-- Window movement
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>v', ':vs<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>v', ':vs<CR>', {silent = true})
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")

-- Plugins keybindings
vim.api.nvim_set_keymap('n', '<C-t>','<CMD>lua require("FTerm").toggle()<CR>', {noremap = true, silent = true} ) -- Toggle FTerm
vim.api.nvim_set_keymap('t', '<C-t>','<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', {noremap = true, silent = true} ) -- Toogle FTerm
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Lazygit', {silent = true}) -- Lazygit
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true}) -- Ranger
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true }) -- Which key

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

lvim.builtin.which_key.mappings["gg"] = {
  "<cmd>:LazyGit<CR>", "LazyGit"
}


-- Global config
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 200 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "typescript",
  "css",
  "vue",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.which_key.mappings = {
      ["c"] = { "<cmd>w!<CR>", "Save" },
      ["q"] = { "<cmd>q!<CR>", "Quit" },
      ["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
      ["w"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
      ["f"] = { "<cmd>Telescope git_files<CR>", "Find File" },
      ["hl"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      b = {
        name = "Buffers",
        j = { "<cmd>BufferPick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers<cr>", "Find" },
        b = { "<cmd>b#<cr>", "Previous" },
        w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
        e = {
          "<cmd>BufferCloseAllButCurrent<cr>",
          "Close all but current",
        },
        h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
        l = {
          "<cmd>BufferCloseBuffersRight<cr>",
          "Close all to the right",
        },
        D = {
          "<cmd>BufferOrderByDirectory<cr>",
          "Sort by directory",
        },
        L = {
          "<cmd>BufferOrderByLanguage<cr>",
          "Sort by language",
        },
      },
      p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },

      -- " Available Debug Adapters:
      -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
      -- " Adapter configuration and installation instructions:
      -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      -- " Debug Adapter protocol:
      -- "   https://microsoft.github.io/debug-adapter-protocol/
      -- " Debugging
      l = {
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
      },
      g = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        g = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        s = { "<cmd>:LazyGit<cr>", "LazyGit" },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
          "<cmd>Telescope git_bcommits<cr>",
          "Checkout commit(for current file)",
        },
        -- d = {
        --   "<cmd>Gitsigns diffthis HEAD<cr>",
        --   "Git Diff",
        -- },
      },

      y = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
          "<cmd>Telescope lsp_document_diagnostics<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope lsp_workspace_diagnostics<cr>",
          "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
          "Prev Diagnostic",
        },
        p = {
          name = "Peek",
          d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
          t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
          i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
        },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
      L = {
        name = "+LunarVim",
        c = {
          "<cmd>edit" .. get_config_dir() .. "/config.lua<cr>",
          "Edit config.lua",
        },
        f = {
          "<cmd>lua require('core.telescope').find_lunarvim_files()<cr>",
          "Find LunarVim files",
        },
        g = {
          "<cmd>lua require('core.telescope').grep_lunarvim_files()<cr>",
          "Grep LunarVim files",
        },
        k = { "<cmd>lua require('keymappings').print()<cr>", "View LunarVim's default keymappings" },
        i = {
          "<cmd>lua require('core.info').toggle_popup(vim.bo.filetype)<cr>",
          "Toggle LunarVim Info",
        },
        I = {
          "<cmd>lua require('core.telescope').view_lunarvim_changelog()<cr>",
          "View LunarVim's changelog",
        },
        l = {
          name = "+logs",
          d = {
            "<cmd>lua require('core.terminal').toggle_log_view(require('core.log').get_path())<cr>",
            "view default log",
          },
          D = { "<cmd>lua vim.fn.execute('edit ' .. require('core.log').get_path())<cr>", "Open the default logfile" },
          l = { "<cmd>lua require('core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>", "view lsp log" },
          L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
          n = {
            "<cmd>lua require('core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
            "view neovim log",
          },
          N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
          p = {
            "<cmd>lua require('core.terminal').toggle_log_view('packer.nvim')<cr>",
            "view packer log",
          },
          P = { "<cmd>exe 'edit '.stdpath('cache').'/packer.nvim.log'<cr>", "Open the Packer logfile" },
        },
        r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload configurations" },
        u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope grep_string search=<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        p = {
          "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview",
        },
      },
      T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>", "Info" },
      },
    }
