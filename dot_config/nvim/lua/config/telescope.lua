-- github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#dont-preview-binaries
local previewers = require 'telescope.previewers'
local Job = require 'plenary.job'
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job
    :new({
      command = 'file',
      args = { '--mime-type', '-b', filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], '/')[1]
        if mime_type == 'text' then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          -- maybe we want to write something to the buffer here
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
          end)
        end
      end,
    })
    :sync()
end

require('telescope').load_extension 'fzf'
require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    buffer_previewer_maker = new_maker,
    layout_config = {
      width = 0.94,
      height = 0.95,
      vertical = {
        preview_height = 0.47,
        preview_cutoff = 35,
      },
    },
  },
  pickers = {
    builtin = {
      theme = 'dropdown',
      layout_config = {
        height = 0.65,
      },
      previewer = false,
    },
    buffers = {
      -- previewer = false,
      theme = 'ivy',
    },
  },
}
