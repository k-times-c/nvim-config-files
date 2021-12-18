use {'tpope/vim-fugitive', opt = true, cmd = {'G', 'Git', 'Gread', 'Gwrite', 'Gdiff'}}

vim.api.nvim_set_keymap('n', 'g ', ':Git ', { noremap = true})
