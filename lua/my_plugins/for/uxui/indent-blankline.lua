-- init.lua
use { "lukas-reineke/indent-blankline.nvim", 
	opt = true,
	cmd = "IndentBlankLineEnable",
	config = function()
		require('indent_blankline').setup{
		show_end_of_line = true
	}
	end
}
