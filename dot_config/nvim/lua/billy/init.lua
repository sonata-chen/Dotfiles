-- fcitx5
if vim.fn.executable('fcitx5-remote') == 1 then
  local function store_fcitx5_state()
    -- use string.sub() to remove newline character
    vim.w.fcitx5state = string.sub(vim.fn.system('fcitx5-remote'), 1, 1)
  end

  store_fcitx5_state()
  local fcitx5_group = vim.api.nvim_create_augroup('fcitx5', { clear = true })

  -- Disable the input method when exiting insert mode and save the state
  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      store_fcitx5_state()
      os.execute('fcitx5-remote -c')
    end,
    group = fcitx5_group,
    pattern = '*',
  })

  -- 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode
  vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
      if vim.w.fcitx5state == '2' then
        os.execute('fcitx5-remote -o')
      end
    end,
    group = fcitx5_group,
    pattern = '*',
  })
end

-- tabs
vim.opt.tabstop = 8      -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4  -- When zero the 'tabstop' value will be used.
vim.opt.shiftwidth = 4   -- When zero the 'tabstop' value will be used.
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
vim.opt.scrolloff = 3

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
vim.opt.shortmess:append 'c'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'


vim.cmd [[
  " Moving text
  vnoremap <M-j> :m '>+1<CR>gv=gv
  vnoremap <M-k> :m '<-2<CR>gv=gv
  inoremap <M-j> <esc>:m .+1<CR>==
  inoremap <M-k> <esc>:m .-2<CR>==
  nnoremap <M-j> :m .+1<CR>==
  nnoremap <M-k> :m .-2<CR>==
]]

-- enable treesitter folding module
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false -- Disable folding at startup.


vim.keymap.set({ 'n' }, '<Space>l', ':Format<CR>', { silent = true })

-- Undo break points
vim.keymap.set("n", ",", ",<c-g>u")
vim.keymap.set("n", ".", ".<c-g>u")
vim.keymap.set("n", "-", "-<c-g>u")
vim.keymap.set("n", "_", "_<c-g>u")
vim.keymap.set("n", "!", "!<c-g>u")
vim.keymap.set("n", "?", "?<c-g>u")


-- Keeping it centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
