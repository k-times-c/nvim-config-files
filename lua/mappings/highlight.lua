

Execute_macro_over_multiple_lines = function()
	print("@")
end


-- lua
-- plugin
-- .gitignore
-- init.lua
--
vim.api.nvim_set_keymap('x', '@', "<cmd>lua Execute_macro_over_multiple_lines()<CR>", { noremap = true } )
