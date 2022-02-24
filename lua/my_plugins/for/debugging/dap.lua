use {'mfussenegger/nvim-dap',
  opt = true,
  -- ft = { 'python', 'lua' },
  requires = { "nvim-dap-virtual-text", "rcarriga/nvim-dap-ui" },
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>dG', '<cmd>lua require"dap".continue()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".step_over()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dj', '<cmd>lua require"dap".step_into()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dk', '<cmd>lua require"dap".step_out()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dB', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".run_last()<CR>', { noremap = true })
  end
}

use { 'jbyuki/one-small-step-for-vimkind',
  opt = true,
  requires = "rcarriga/nvim-dap-ui",
  config = function()
  local dap = require("dap")
  dap.configurations.lua = {
    {
      type = 'nlua',
      request = 'attach',
      name = "Attach to running Neovim instance",
      host = function()
        local value = vim.fn.input('Host [127.0.0.1]: ')
        if value ~= "" then
    return value
        end
        return '127.0.0.1'
      end,
      port = function()
        local val = tonumber(vim.fn.input('Port: '))
        assert(val, "Please provide a port number")
        return val
      end,
    }
  }
  dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host, port = config.port })
  end
end
}

