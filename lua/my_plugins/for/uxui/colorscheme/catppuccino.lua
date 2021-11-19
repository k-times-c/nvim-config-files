use {
	"catppuccin/nvim",
	config = function()
		require('catppuccin').setup {
			transparent_background = true,
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

vim.cmd([[ colorscheme catppuccin ]])

-- vim.cmd([[ highlight! Normal ctermbg=NONE guibg=NONE]])
-- vim.cmd([[ highlight! NonText ctermbg=NONE guibg=NONE]])
