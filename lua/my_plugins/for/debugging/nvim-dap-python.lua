use { 'mfussenegger/nvim-dap-python',
  opt = true,
  ft = "python",
  require = "mfussenegger/nvim-dap",
  config = function()
    if vim.fn.has('Mac') == 0 then
      require('dap-python').setup('~/.virtualenvs/debugpy/Scripts/python.exe')
    else
      print('set virtual env for macbook')
    end
      require('dap-python').test_runner = 'pytest'
    vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua require("dap-python").test_method()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua require("dap-python").test_class()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>ds', '<cmd>lua require("dap-python").debug_selection()<CR>', { noremap = true, silent = true } )
  end
}
