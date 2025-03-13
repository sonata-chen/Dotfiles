local function config_lsp()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Enable underline, use default values
      underline = true,
      -- Enable virtual text, override spacing to 4
      virtual_text = {
        spacing = 4,
      },
      signs = false,
      update_in_insert = true,
    }
  )

  vim.lsp.handlers["textDocument/diagnostic"] = vim.lsp.with(
    vim.lsp.diagnostic.on_diagnostic, {
      -- Enable underline, use default values
      underline = true,
      -- Enable virtual text, override spacing to 4
      virtual_text = {
        spacing = 4,
      },
      signs = false,
      update_in_insert = true,
    }
  )

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end,
  })

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  local servers = {
    clangd = {},
    ruff = {},
    basedpyright = {
      analysis = {
        diagnosticMode = "openFilesOnly",
      }
    },
    --[[
    pylsp = {
      pylsp = {
        plugins = {
          pycodestyle = { enabled = false, },
          pyflakes = { enabled = false, },
          mccabe = { enabled = false, },
          autopep8 = { enabled = false, },
          yapf = { enabled = false, },
          mypy = { enabled = true, },
        }
      }
    },
    ]] --

    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }

  -- Setup neovim lua configuration
  require('neodev').setup()

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Setup mason so it can manage external tooling
  require('mason').setup()

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    -- ensure_installed = vim.tbl_keys(servers),
  }

  for server, _ in pairs(servers) do
    require('lspconfig')[server].setup {
      capabilities = capabilities,
      settings = servers[server]
    }
  end

  require("rust-tools").setup {
    server = {
      -- options to pass to nvim-lspconfig
      capabilities = capabilities,
      settings = {},
    },
  }
end

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      config_lsp()
    end,
  },

  'p00f/clangd_extensions.nvim',
  'simrat39/rust-tools.nvim',
}
