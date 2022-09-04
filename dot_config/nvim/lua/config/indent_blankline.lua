require('indent_blankline').setup {
  -- char = '│',
  char = '┊',
  show_trailing_blankline_indent = false,
  filetype_exclude = { 'man', 'packer', 'dashboard' },
  buftype_exclude = { 'help', 'terminal', 'nofile' },
  -- use_treesitter = false, -- wait for c++
}
