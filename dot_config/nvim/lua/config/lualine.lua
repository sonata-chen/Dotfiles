require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '',
    section_separators = '',
    globalstatus = true,
    diagnostics_color = {
      -- Same values as the general color option can be used here.
      error = 'DiagnosticError', -- Changes diagnostics' error color.
      warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
      info = 'DiagnosticInfo', -- Changes diagnostics' info color.
      hint = 'DiagnosticHint', -- Changes diagnostics' hint color.
    },
    diff_color = {
      -- Same color values as the general color option can be used here.
      added = 'GitSignsAdd', -- Changes the diff's added color
      modified = 'GitSignsChange', -- Changes the diff's modified color
      removed = 'GitSignsDelete', -- Changes the diff's removed color you
    },
  },
}
