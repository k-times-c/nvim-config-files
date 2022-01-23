require('my_plugins/for/testing/vim-test')
if vim.fn.has('Mac') == 1 then
  require('my_plugins/for/testing/vim-ultest')
end
