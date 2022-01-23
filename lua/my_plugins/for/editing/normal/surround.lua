
use { 'tpope/vim-surround', opt = true, keys =  {'ys', 'ds', 'cs', { 'v', 'S' }}}
local nowait_noremap = function(keymap) vim.api.nvim_set_keymap("n", keymap, "<cmd>normal! " .. keymap .. "<cr>", { noremap = true, nowait = true } ) end
for _, key in ipairs({"yy", "dd", "cc"}) do
	nowait_noremap(key)
end
