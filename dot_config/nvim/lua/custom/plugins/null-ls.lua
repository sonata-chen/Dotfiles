return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function (_, _)
      local null_ls = require('null-ls')
      null_ls.setup{
        sources = { null_ls.builtins.diagnostics.shellcheck }
      }

    end,
  }

}
