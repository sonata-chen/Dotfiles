local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local border = {
      {"╔", "FloatBorder"},
      {"═", "FloatBorder"},
      {"╗", "FloatBorder"},
      {"║", "FloatBorder"},
      {"╝", "FloatBorder"},
      {"═", "FloatBorder"},
      {"╚", "FloatBorder"},
      {"║", "FloatBorder"},
}

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-Space>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available']() == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, {
      'i',
      's',
    }),

    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, {
      'i',
      's',
    }),
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  },
  experimental = {
    ghost_text = true,
  },
  view = {
    entries = 'custom', -- can be "custom", "wildmenu" or "native"
  },
  window = {
    completion = { border = border },
    documentation = { border = border },
  },
}
