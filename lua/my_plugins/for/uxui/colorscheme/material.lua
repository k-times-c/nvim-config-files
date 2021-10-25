use { 'kaicataldo/material.vim' }
vim.api.nvim_set_var('material_terminal_italics', 1)
vim.api.nvim_set_var('material_theme_style', 'darker')

-- vim.cmd([[ highlight Normal ctermfg=231 guifg=#eeffff guibg=#212121 ]])
vim.cmd([[highlight Normal ctermfg=grey ctermbg=darkblue ]])
vim.cmd([[ colorscheme material ]])
