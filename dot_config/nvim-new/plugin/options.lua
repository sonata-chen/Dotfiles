-- tabs
vim.opt.tabstop = 8 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4 -- When zero the 'tabstop' value will be used.
vim.opt.shiftwidth = 4 -- When zero the 'tabstop' value will be used.
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- characters to show tabs and trailing blanks
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·' }

-- Because a statusline plugin is being used, we don't need this option.
vim.opt.showmode = false

-- vim.opt.colorcolumn = '100'
vim.opt.breakindent = true
vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- navigation
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 8

-- Searching
-- vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.swapfile = false
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience.
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- Avoid showing extra message when using completion.
vim.opt.shortmess:append('c')

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

vim.opt.exrc = true
vim.opt.wrap = false

-- enable treesitter folding module
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    if not pcall(vim.treesitter.start) then
      return
    end

    local winid = vim.api.nvim_get_current_win()
    vim.wo[winid][0].foldmethod = 'expr'
    vim.wo[winid][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[winid][0].foldenable = false -- Disable folding at startup.
  end,
})
