-- require('my_plugins/for/uxui/cursorline/feline')
-- TODO: reload and add pomodoro within the status line when loaded
use {'nvim-lualine/lualine.nvim', config = function()
    -- require('lualine').setup { sections = { lualine_c = { 'filename', require('pomodoro').statusline() } } }
end
}
