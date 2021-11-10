use { 'akinsho/bufferline.nvim',
	requires = 'kyazdani42/nvim-web-devicons',
	config = function() 
		require('bufferline').setup {
			options = {
				diagnostics = "nvim_lsp",
				custom_filter = function(buf_number) 
					if vim.bo[buf_number].filetype ~= "vimwiki" then
						return true
					end
				end
			}
		}
		end
}
