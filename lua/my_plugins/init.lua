local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'f-person/git-blame.nvim'

  require('my_plugins/for/completion')
  require('my_plugins/for/git_integration')
  require('my_plugins/for/navigation')
  require('my_plugins/for/commenting')
  require('my_plugins/for/lsp')
  require('my_plugins/for/file_explorer')
  require('my_plugins/for/colorscheme')
  require('my_plugins/for/cursorline')
  require('my_plugins/for/notetaking')
  require('my_plugins/for/treesitter')
  require('my_plugins/for/which-key')
  use 'tpope/vim-surround'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
