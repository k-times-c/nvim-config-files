use { "Pocco81/TrueZen.nvim", opt = true, keys = { 'ZM', 'ZF', 'ZA' }, config = function()
	require('true-zen').setup {
		integrations = {
			gitsigns = true,
			nvim_bufferline = true,
			feline = true
		}
	}
	vim.api.nvim_set_keymap('n', 'ZM', '<Cmd>TZMinimalist<CR>', { noremap = true })
	vim.api.nvim_set_keymap('n', 'ZF', '<Cmd>TZFocus<CR>', { noremap = true })
	vim.api.nvim_set_keymap('n', 'ZA', '<Cmd>TZAtaraxis<CR>', { noremap = true })
	end
}
