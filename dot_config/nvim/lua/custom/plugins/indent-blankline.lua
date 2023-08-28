return
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      -- char = '│',
      char = '┊',
      show_trailing_blankline_indent = false,
      filetype_exclude = { 'man', 'packer', 'dashboard' },
      buftype_exclude = { 'help', 'terminal', 'nofile' },
      -- use_treesitter = false, -- wait for c++
      -- show_current_context = true,
      -- show_current_context_start = true,
    },
  }
