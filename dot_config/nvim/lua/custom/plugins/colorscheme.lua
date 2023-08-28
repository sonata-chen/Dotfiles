return
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
      vim.cmd.colorscheme 'onedark'
    end,
  }
