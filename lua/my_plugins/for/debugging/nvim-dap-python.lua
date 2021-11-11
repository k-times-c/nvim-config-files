use { 'mfussenegger/nvim-dap-python',
	  opt = true,
	  -- ft = "python",
	  require = "vim-dap",
	  config = function()
	   require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
	  end
}
