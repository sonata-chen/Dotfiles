-- fcitx5
if vim.fn.executable('fcitx5-remote') == 1 then
  local function store_fcitx5_state()
    -- use string.sub() to remove newline character
    vim.w.fcitx5state = string.sub(vim.fn.system('fcitx5-remote'), 1, 1)
  end

  store_fcitx5_state()
  local fcitx5_group = vim.api.nvim_create_augroup('fcitx5', { clear = true })

  -- Disable the input method when exiting insert mode and save the state
  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      store_fcitx5_state()
      os.execute('fcitx5-remote -c')
    end,
    group = fcitx5_group,
    pattern = '*',
  })

  -- 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode
  vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
      if vim.w.fcitx5state == '2' then
        os.execute('fcitx5-remote -o')
      end
    end,
    group = fcitx5_group,
    pattern = '*',
  })
end
