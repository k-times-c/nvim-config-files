use { "ThePrimeagen/harpoon", opt = true, keys = {"<leader>ho", "<leader>ha",  "<leader>ht", "<leader>hsc"},
	requires = { 'nvim-lua/plenary.nvim'},
	config = function() require("harpoon").setup() end
}

--- personal mappings
vim.api.nvim_set_keymap('n', "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", { noremap = true, silent = true })
