use { "vim-test/vim-test" , opt = true, cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit"}}

vim.api.nvim_set_keymap('n', 't<C-n>', '<cmd>TestNearest<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-f>', '<cmd>TestFile<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-s>', '<cmd>TestSuite<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-l>', '<cmd>TestLast<CR>', { noremap = true } )
vim.api.nvim_set_keymap('n', 't<C-v>', '<cmd>TestVisit<CR>', { noremap = true } )

-- vim.cmd[[ let test#strategy = { 'nearest': 'neovim', 'file': 'dispatch' , 'suite': 'basic' } ]]
-- TODO: add pytest compiler err-formatter
-- vim.g['test#strategy'] = { nearest = 'neovim', file = 'dispatch' , suite = 'basic' }
