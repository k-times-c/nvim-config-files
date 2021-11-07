use { 
	"Pocco81/Catppuccino.nvim",
	config = function()
		require('catppuccino').setup {
			integrations = {
				transparency = false,
				telescope = true,
				which_key = true,
				gitsigns = true,
				ts_rainbow = true,
				lsp_trouble = true,
				markdown = true,
				bufferline = true,
				indent_blankline = { enabled = true }
			}
		}
	end
}
vim.cmd([[ colorscheme dark_catppuccino ]])
