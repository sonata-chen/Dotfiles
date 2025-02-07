return
{

  { -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      -- style = 'dark',
      style = 'warmer',
      toggle_style_key = "<leader>ts"

    },
    config = function(_, opts)
      require('onedark').setup(opts)
      -- vim.cmd.colorscheme 'onedark'
    end,
  },
  {

    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  }
}
