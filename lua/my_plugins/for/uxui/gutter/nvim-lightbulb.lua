use { 'kosayoda/nvim-lightbulb.lua', 
	config = function() vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]] 
	end 
}