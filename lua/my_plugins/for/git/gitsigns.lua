use { 'lewis6991/gitsigns.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  config = function()
    require('gitsigns').setup()
    vim.api.nvim_set_keymap('n', '|r', '<cmd>Gitsigns reset_hunk<cr>', { noremap = true})
    vim.api.nvim_set_keymap('n', '|G', ':Gitsigns ', { noremap = true})
  end
}
