use { "vim-test/vim-test" }

vim.api.nvim_set_keymap('n', 't<C-n>', '<cmd>TestNearest<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-f>', '<cmd>TestFile<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-s>', '<cmd>TestSuite<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-l>', '<cmd>TestLast<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-g>', '<cmd>TestVisit<CR>', { noremap = true } )
