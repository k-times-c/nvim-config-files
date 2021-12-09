if vim.fn.has('Mac') == 1 then
	require 'my_plugins/for/notetaking/neorg'
else
	require "my_plugins/for/notetaking/vimwiki"
end
