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

local config_home = ''

if vim.fn.has('Mac') == 1 then
	config_home = '~/.config/nvim/'
else
	config_home = '~/AppData/Local/nvim/'
end
-- Find files using Telescope command-line sugar.
local opts = { noremap = true }
-- TODO: make higher order function to shorten mapping calls
-- local nnoremap = vim.api.nvim_set_keymap('n', '<leader>f' .. keys , "
vim.api.nvim_set_keymap('n', "<leader>fl", "<cmd>Telescope buffers<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fc", "<cmd>Telescope commands<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fn", "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'nvim config', cwd = '" .. config_home .. "'})<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fs", "<cmd>lua require('telescope.builtin').file_browser({ prompt_title = 'plugins', cwd = '~\\AppData\\Local\\nvim-data\\site'})<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fb", "<cmd>lua require('telescope.builtin').file_browser()<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>f%", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
-- TODO: on enter set the working directory for the buffer (if not possible then the window)
vim.api.nvim_set_keymap('n', "<leader>f.", "<cmd>lua require('telescope.builtin').find_files({ prompt_title = 'find files in filenames current directory', cwd = '" .. vim.fn.expand('%:h')  .. "'})<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fp", "<cmd>Telescope projects<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>fr", "<cmd>Telescope resume<cr>", opts)

vim.api.nvim_set_keymap('n', "<leader>gc", "<cmd>Telescope git_bcommits<cr>", opts)
vim.api.nvim_set_keymap('n', "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
-- C:/Users/gruq/AppData/Local/nvim-data/site/pack/packer/start/

if vim.fn.has('Mac') == 0 then
	vim.api.nvim_set_keymap('n', "<leader>fof", "<cmd>lua require('telescope.builtin').find_files({prompt_title = '< omniFileTransfer >', cwd = '~/Development/Omni/omniFileTransfer'})<cr>", opts)
	vim.api.nvim_set_keymap('n', "<leader>foc", "<cmd>lua require('telescope.builtin').find_files({prompt_title = '< omniCodec >', cwd = '~/Development/Omni/omniCodec'})<cr>", opts)
end
