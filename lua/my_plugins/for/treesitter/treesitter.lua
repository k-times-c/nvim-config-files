
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', opt = true,
config = function()
	local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
	require('nvim-treesitter/configs').setup {}
end
}
-- use { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' }
