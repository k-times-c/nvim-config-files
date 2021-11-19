vim.api.nvim_set_keymap('n', 'gV', '`[v`]', { noremap = true } )
vim.api.nvim_set_keymap('n', 'gf', "<cmd>normal! vi'gf<cr>", { noremap = true } )
vim.api.nvim_set_keymap('n', 'Y', "yg_", { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>gfn', '<cmd>let @"=@%<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>update<CR>', { noremap = true } )
-- vim.api.nvim_set_keymap('n', '<leader>x', ':normal lua ', { noremap = true } )
--[[ vim.cmd( [[
	function! kxclark#StripTrailingWhitespaces()
		"taken from vimcasts
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
	endfunction
	nnoremap ,sws <cmd>call kxclark#StripTrailingWhitespaces()<cr>
)
]]

vim.api.nvim_set_keymap('n', 't<C-n>', '<cmd>TestNearest<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-f>', '<cmd>TestFile<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-s>', '<cmd>TestSuite<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-l>', '<cmd>TestLast<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-g>', '<cmd>TestVisit<CR>', { noremap = true } )
