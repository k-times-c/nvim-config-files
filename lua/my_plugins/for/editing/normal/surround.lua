
if vim.fn.exists("loaded_surround") == 0 or vim.g.loaded_surround ~= 1 then
	local nowait_noremap = function(keymap) vim.api.nvim_set_keymap("n", keymap, "<cmd>normal! " .. keymap .. "<cr>", { noremap = true, nowait = true } ) end
	for _, key in ipairs({"yy", "dd", "cc"}) do
		nowait_noremap(key)
	end
end
use { 'tpope/vim-surround', opt = true, keys =  {'ys', 'ds', 'cs', { 'v', 'S' }}}
