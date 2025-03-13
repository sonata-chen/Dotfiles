-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    enabled = true,
    opts = {},
  },
  {
    "keaising/im-select.nvim",
    opts = {},
    enabled = false,
  },
  {
    "NeogitOrg/neogit",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  }
}
