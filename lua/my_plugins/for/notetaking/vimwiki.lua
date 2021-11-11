require('packer').use { 'vimwiki/vimwiki', opt = true, keys = {"<leader>w<leader>w", "<leader>ww", "<Leader>wt"}, ft = {"vimwiki", "markdown" } }
-- vim.g.wiki_list = [[[{'path': '~/my_wiki/'}]]]
-- vim.api.nvim_set_var('wiki_list', [[ [{'path': '~/my_wiki/'}] ]])
-- vim.g.vimwiki_path = '~/wiki'
--[[ vim.api.set_keymap('n', '<leader>wp', 'Denite file -path=' .. vim.g.vimwiki_path .. '/projects', nnoremap = true)
vim.api.set_keymap('n', '<leader>wm', 'Denite file -path=' .. vim.g.vimwiki_path .. '/meetings', nnoremap = true) ]]
local wiki_parent_dir = ""
if vim.fn.has("Mac") == 1 then
	vim.cmd([[ let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}] ]])
else
	wiki_parent_dir =  'C:/Users/gruq/OneDrive - Nordstrom'
	local wiki_settings = [[ [{'path': ']] .. wiki_parent_dir .. [[/wiki/', 'syntax': 'markdown', 'ext': '.md'}] ]]
	vim.cmd("let g:vimwiki_list = " .. wiki_settings)
end
--[[ " p - projects  {{{
nnoremap ,wp :call execute('Denite file -path=' . g:vimwiki_path . '/projects')<CR>
" }}}
" m - meetings  {{{
nnoremap ,wm :call execute('Denite file -path=' . g:vimwiki_path . '/meetings')<CR>
" }}} ]]
vim.g.vimwiki_listsyms = '✗○◐●✓'
