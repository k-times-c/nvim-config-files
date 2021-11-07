use { 'theHamsta/nvim-dap-virtual-text', opt = true, requires = {'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter'},
config = function()
	require('nvim-dap-virtual-text').setup()
end}
    -- virtual text deactivated (default)
    -- vim.g.dap_virtual_text = false
    -- show virtual text for current frame (recommended)
    -- vim.g.dap_virtual_text = true
    -- request variable values for all frames (experimental)
    -- vim.g.dap_virtual_text = 'all frames'
