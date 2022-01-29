require('kxc.globals')
require('settings')
require('mappings')
require('my_plugins')

-- After
vim.api.nvim_exec([[set foldexpr=nvim_treesitter#foldexpr()]], true)
