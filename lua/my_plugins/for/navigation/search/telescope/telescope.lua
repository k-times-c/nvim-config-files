use {
  'nvim-telescope/telescope.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  config = function()
	local telescope = require('telescope')
	telescope.setup {
		 defaults = {
		   preview = {
		     check_mime_type = false
		   },
		 shorten_path = true
		 }
	}
	-- To get fzf loaded and working with telescope, you need to call
	-- load_extension, somewhere after setup function:
	telescope.load_extension('fzf')
  end
}

use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', requires = 'nvim-telescope/telescope.nvim' }

if vim.fn.has('Mac') == 1 then
	config_home = '~/.config/nvim/'
else
	config_home = '~/AppData/Local/nvim/'
end
-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>fc", "<cmd>Telescope commands<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>fk", "<cmd>Telescope keymaps<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>fn", "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'nvim config', cwd = '" .. config_home .. "'})<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
-- TODO: on enter set the working directory for the buffer (if not possible then the window)
vim.api.nvim_set_keymap('n', "<leader>fp", "<cmd>Telescope projects<cr>", { noremap = true })
