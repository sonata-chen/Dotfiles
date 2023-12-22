-- fcitx5
if vim.fn.executable('fcitx5-remote') == 1 then
  local function store_fcitx5_state()
    -- use string.sub() to remove newline character
    vim.w.fcitx5state =  string.sub(vim.fn.system('fcitx5-remote'), 1, 1)
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
vim.opt.tabstop = 8 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4 -- When zero the 'tabstop' value will be used.
vim.opt.shiftwidth = 4 -- When zero the 'tabstop' value will be used.
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

vim.cmd [[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set nofoldenable " Disable folding at startup.
]]
