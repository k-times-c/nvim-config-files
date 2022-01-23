require('my_plugins/for/editing/normal/commenting')
require('my_plugins/for/editing/normal/surround')
require('my_plugins/for/editing/normal/vim-repeat')
require('my_plugins/for/editing/normal/surround')

use {'AndrewRadev/switch.vim', keys = 'gs' }
use {'AndrewRadev/splitjoin.vim', keys = {'gS', 'gJ'} }
use {'famiu/bufdelete.nvim',  cmd = { 'Bdelete', 'Bwipeout' } }
-- use {'andymass/vim-matchup', opt = true, keys = '%' }
use {'tommcdo/vim-exchange'}
use {'wellle/targets.vim',
	config = function()
		vim.g.targets_nl = 'nN'
	end
}
