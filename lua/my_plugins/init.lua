local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

use = require('packer').use
return require('packer').startup(function(use)

-- TODO: pull out to its own file
  use {'wbthomason/packer.nvim'}
-- TODO: pull out to its own file
  use { 'andymass/vim-matchup', opt = true, keys = '%' }
  use { 'tommcdo/vim-exchange' }
  use {'wellle/targets.vim'}
  require('my_plugins/for/uxui')
  require('my_plugins/for/lsp')
  require('my_plugins/for/treesitter')
  require('my_plugins/for/git')
  require('my_plugins/for/navigation')
  require('my_plugins/for/notetaking')
  require('my_plugins/for/snippet-support')
  require('my_plugins/for/testing')
  require('my_plugins/for/code-running')
  require('my_plugins/for/editing')
  require('my_plugins/for/debugging')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
