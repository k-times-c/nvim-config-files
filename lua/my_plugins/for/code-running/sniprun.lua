  use { 'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = { "SnipRun" },
config = function()
  require'sniprun'.setup({
  display = {
 --    "Notification",                    --# display results in the command-line  area
    -- "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
    -- "VirtualTextErr",          --# display error results as virtual text
    -- "TempFloatingWindow",      --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
    -- "Terminal",                --# display results in a vertical split
    "NvimNotify",              --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  }
})
end
}

vim.api.nvim_set_keymap('n', '<leader>xx', '<Plug>SnipRun', { noremap = true } )
vim.api.nvim_set_keymap('n', '<leader>x', '<Plug>SnipRunOperator', { noremap = true } )
vim.api.nvim_set_keymap('v', '<leader>x', '<Plug>SnipRun', { noremap = true } )
