use { 'akinsho/bufferline.nvim',
	requires = 'kyazdani42/nvim-web-devicons',
	config = function() 
		require('bufferline').setup {
			diagnostics = "nvim_lsp"
		}
		end
}
