use { "ThePrimeagen/harpoon",
	requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
	config = function()
	require("harpoon").setup({
	    global_settings = {
		save_on_toggle = false,
		save_on_change = false,
		enter_on_sendcmd = false,
	    },
	 --   ... your other configs ...
	})
	end
}

--- personal mappings
vim.api.nvim_set_keymap('n', "<leader>ha", ":lua require('harpoon.mark').add_file()", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ho", ":lua require('harpoon.ui').toggle_quick_menu()", { noremap = true })

