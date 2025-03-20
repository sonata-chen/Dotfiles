vim.keymap.set('n', '<leader>x', ":.lua<CR>")
vim.keymap.set('v', '<leader>x', ":lua<CR>")
vim.keymap.set('n', '<leader>X', ":source %<CR>")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>s.', require('telescope').extensions.frecency.frecency,
  { desc = '[S]earch Recent Files ("." for repeat)' }
)
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev()
  vim.cmd.normal "zz"
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next()
  vim.cmd.normal "zz"
end, { desc = "Go to next diagnostic message" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set('n', '<leader>q', "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open diagnostics list" })
vim.keymap.set('n', '<leader>v', ":Trouble lsp_document_symbols toggle win.position=right<CR>",
  { desc = "Open document symbols list" }
)


-- Moving text
vim.cmd [[
  vnoremap <M-j> :m '>+1<CR>gv=gv
  vnoremap <M-k> :m '<-2<CR>gv=gv
  inoremap <M-j> <esc>:m .+1<CR>==
  inoremap <M-k> <esc>:m .-2<CR>==
  nnoremap <M-j> :m .+1<CR>==
  nnoremap <M-k> :m .-2<CR>==
]]

-- Undo break points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "-", "-<c-g>u")
vim.keymap.set("i", "_", "_<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- keeping it centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- g command
vim.keymap.set({ "n", "x", "o" }, "gm", "%")
vim.keymap.set({ "n", "x", "o" }, "gh", "^")
vim.keymap.set({ "n", "x", "o" }, "gl", "$")
vim.keymap.set({ "n" }, "ga", "<c-6>")

-- System clipboard
vim.keymap.set({ "n", "x" }, "<leader>f", '"+', { desc = "clipboard register" })

-- Oil file explorer
vim.keymap.set({ "n" }, '<leader>o',
  function() require "oil".open(nil, { preview = { vertical = true } }) end,
  { desc = "open oil file explorer" })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('oil-close', { clear = true }),
  pattern = 'oil',
  callback = function(event)
    vim.keymap.set({ "n" }, '<leader>o',
      require "oil".close,
      { buffer = event.buf, desc = "close oil file explorer" })
  end
})



-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    -- Find references for the word under your cursor.
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap.
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
      vim.lsp.buf.format({ async = true })
    end, { desc = 'Format current buffer with LSP' })

    vim.keymap.set({ 'n' }, '<Space>l', ':Format<CR>', { silent = true })
  end,
})
