use { "beauwilliams/focus.nvim", opt = true, 
	cmd = { "FocusNicely", "FocusToggle", "FocusEnable" },
	config = function() 
	      require("focus").setup() 
end
}
vim.api.nvim_set_keymap('n', 'ZE', '<cmd>:FocusEnable<CR>', { noremap = true } )
