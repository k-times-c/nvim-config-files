use 'winston0410/cmd-parser.nvim'
use {'winston0410/range-highlight.nvim',
	requires = {'winston0410/cmd-parser.nvim'},
	opt = true,
	event = 'CmdlineEnter',
	config = function() 
		require("range-highlight").setup {}
	end,
}
