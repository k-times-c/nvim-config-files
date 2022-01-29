-- Jumplist mutations
vim.cmd([[
	nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "g") . 'k'
	nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "g") . 'j'
]])
-- nnoremap j <cmd>call tj#jump_direction('j')<CR>
-- nnoremap k <cmd>call tj#jump_direction('k')<CR>
-- -- " Does:
-- "   For wrapped lines, does gj/gk
-- "   For large jumps, adds a spot on the jump list
-- function! tj#jump_direction(letter)
--   let jump_count = v:count
--
--   if jump_count == 0
--     call execute(printf('normal! g%s', a:letter))
--     return
--   endif
--
--   if jump_count > 5
--     call execute("normal! m'")
--   endif
--
--   call execute(printf('normal! %d%s', jump_count, a:letter))
-- endfunction

vim.api.nvim_set_keymap('n', 'gV', '`[v`]', { noremap = true } )
-- vim.api.nvim_set_keymap('n', 'gf', "<cmd>normal! vi'gf<cr>", { noremap = true } )
vim.api.nvim_set_keymap('n', 'y<C-g>', [[<cmd>let @"= expand('%:p')<cr>]], { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>update<CR>', { noremap = true } )
-- TODO: fix this mapping
vim.api.nvim_set_keymap('n', ',x', 'lua vim.cmd(vim.inspect(vim.api.nvim_get_current_line()))<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',,x', ':update <bar> luafile %<CR>', { noremap = true } )
vim.api.nvim_set_keymap('v', '<BS>', '"_d', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-w><BS>', '<cmd>bdelete!<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 'Z<BS>', '<cmd>Bdelete!<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<bslash>q', '<cmd>cwindow<CR>', { noremap = true } )

-- move to other buffers
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true } )
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',sws', '<cmd>%s/\\v\\s+$//gc<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', ',m', '<cmd>call confirm(mkdir(expand("%:p"), "p"))<CR>', { noremap = true } )

