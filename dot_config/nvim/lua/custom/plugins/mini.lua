return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function(_opts)
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.jump2d').setup()
    end,
  },
}
