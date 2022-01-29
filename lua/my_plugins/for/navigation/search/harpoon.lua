use { "ThePrimeagen/harpoon", opt = true,
	keys = {"<leader>ha", "<leader>ht", "<leader>ho" },
	requires = {'nvim-lua/plenary.nvim'},
	config = function() require("harpoon").setup({
		global_settings = {
			enter_on_sendcmd = true
		}
	})
	--- personal mappings
	vim.api.nvim_set_keymap('n', "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', "<leader>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', ">h", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', "<h", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', "<bslash>1", "<cmd>:lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', "<bslash>2", "<cmd>:lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
	end
}
