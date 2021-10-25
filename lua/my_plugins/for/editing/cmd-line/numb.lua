  use 'nacro90/numb.nvim'
  require('numb').setup{
   show_numbers = true, -- Enable 'number' for the window while peeking
   show_cursorline = true, -- Enable 'cursorline' for the window while peeking
   number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
}
  use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }

  local focusmap = function(direction)
    vim.api.nvim_set_keymap('n', '<Leader>'..direction, ":lua require'focus'.split_command('"..direction.."')<CR>", { silent = true })
end
-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
--[[ focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l') ]]

