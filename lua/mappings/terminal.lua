local opts = {noremap = true}
vim.api.nvim_set_keymap('t', '<C-o>', '<C-\\><C-n>', opts )
vim.api.nvim_set_keymap('t', '', '<C-\\><C-n>', opts )
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
