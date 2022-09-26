-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'iamcco/markdown-preview.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require 'config.Comment'
    end,
  }
  use 'tpope/vim-fugitive'

  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  use 'Yazeed1s/minimal.nvim'
  use "rebelot/kanagawa.nvim"
  use 'rmehri01/onenord.nvim'
  use {
    'eddyekofo94/gruvbox-flat.nvim',
    config = function()
      vim.g.gruvbox_flat_style = 'dark'
      vim.cmd [[ colorscheme gruvbox-flat ]]
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'config.indent_blankline'
    end,
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require 'config.lualine'
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'config.treesitter'
    end,
  }

  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'config.lsp'
    end,
  }
  use 'p00f/clangd_extensions.nvim'
  use 'simrat39/rust-tools.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require 'config.telescope'
    end,
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      require 'config.nvim_cmp'
    end,
  }

  use 'ray-x/lsp_signature.nvim'
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
        require 'config.gitsigns'
    end,
  }

  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end,
  }

  use {
    'stevearc/aerial.nvim',
    config = function()
      require 'config.aerial'
    end,
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
    end,
  }

  use 'norcalli/nvim-colorizer.lua'
  use { 'eraserhd/parinfer-rust', disable = true }

  use 'vim-scripts/BufOnly.vim'
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'luukvbaal/stabilize.nvim'
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
end)

-- tabs
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.shiftwidth = 0 -- When zero the 'tabstop' value will be used.
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- characters to show tabs and trailing blanks
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·' }

-- Because a statusline plugin is being used, we don't need this option.
vim.opt.showmode = false

-- vim.opt.colorcolumn = '100'
vim.opt.breakindent = true
vim.opt.cursorline = true

-- vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- navigation
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 3

-- Searching
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.swapfile = false

-- Set completeopt to have a better completion experience.
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- Avoid showing extra message when using completion.
vim.opt.shortmess:append 'c'

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', { silent = true })
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<cr>', { silent = true })
vim.keymap.set('n', '<leader>ps', ':PackerSync<cr>', { silent = true })
vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>', { silent = true })

vim.keymap.set('n', '<C-h>', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>o', require('telescope.builtin').find_files)
vim.keymap.set('n', "<leader>'", require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>t', require('telescope.builtin').builtin)
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)

-- vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<cr>', { silent = true })
vim.keymap.set('n', '<leader>n', ':Neotree reveal<cr>', { silent = true })
vim.keymap.set('n', '<leader>b', ':BOnly<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')

-- vim.cmd [[
--   " Use <Tab> and <S-Tab> to navigate through popup menu
--   inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"
--   inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"
-- ]]

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
  'BufWritePost',
  { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua', desc = 'auto compile' }
)

local YankHighlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = YankHighlight_group,
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

local aerial_filetype_group = vim.api.nvim_create_augroup('AerialFileType', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'aerial',
  group = aerial_filetype_group,
  command = 'setlocal scrolloff=9999999'
})

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#282828]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=#7c6f64 guibg=#282828]]

vim.cmd [[
  " Keeping it centered
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J mzJ`z

  " Undo break points
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap - -<c-g>u
  inoremap _ _<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u

  " Moving text
  vnoremap <C-j> :m '>+1<CR>gv=gv
  vnoremap <C-k> :m '<-2<CR>gv=gv
  inoremap <C-j> <esc>:m .+1<CR>==
  inoremap <C-k> <esc>:m .-2<CR>==
  nnoremap <leader>j :m .+1<CR>==
  nnoremap <leader>k :m .-2<CR>==
]]
