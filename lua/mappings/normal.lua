-- Jumplist mutations
vim.cmd([[
	nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
	nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]])


vim.api.nvim_set_keymap('n', 'gV', '`[v`]', { noremap = true } )
-- vim.api.nvim_set_keymap('n', 'gf', "<cmd>normal! vi'gf<cr>", { noremap = true } )
vim.api.nvim_set_keymap('n', 'y<C-g>', [[<cmd>let @" = expand('%:p')<cr>]], { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>update<CR>', { noremap = true } )
-- TODO: fix this mapping
vim.api.nvim_set_keymap('n', ',x', ':normal lua vim.cmd(vim.inspect(vim.api.nvim_get_current_line()))<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',,x', ':luafile %<CR>', { noremap = true } )
vim.api.nvim_set_keymap('v', '<BS>', '"_d', { noremap = true } )
vim.api.nvim_set_keymap('n', 'Z<BS>', '<cmd>Bdelete!<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<bslash>q', '<cmd>cwindow<CR>', { noremap = true } )

-- move to other buffers
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',sws', '<cmd>%s/\\v\\s+$//gc<CR>', { noremap = true } )
