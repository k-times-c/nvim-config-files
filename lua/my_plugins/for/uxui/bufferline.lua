use { 'akinsho/bufferline.nvim',
	requires = 'kyazdani42/nvim-web-devicons',
	config = function() 
		require('bufferline').setup {
			options = {
				diagnostics = "nvim_lsp",
				custom_filter = function(buf_number)
					local ft = vim.bo[buf_number].filetype
					if ft ~= "vimwiki" or ft ~= 'qf' then
						return true
					end
				end
			}
		}
		end
}
