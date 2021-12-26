-- Jumplist mutations
vim.cmd([[
	nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
	nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]])


vim.api.nvim_set_keymap('n', 'gV', '`[v`]', { noremap = true } )
vim.api.nvim_set_keymap('n', 'gf', "<cmd>normal! vi'gf<cr>", { noremap = true } )
vim.api.nvim_set_keymap('n', 'y<C-g>', [[<cmd>let @" = expand('%:p')<cr>]], { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>update<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',x', ':normal lua vim.cmd(vim.api.nvim_get_current_line())<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',,x', ':luafile %<CR>', { noremap = true } )
vim.api.nvim_set_keymap('v', '<BS>', '"_d', { noremap = true } )
vim.api.nvim_set_keymap('n', 'Z<BS>', '<cmd>Bdelete!<CR>', { noremap = true } )


-- move to other buffers
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true } )


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
