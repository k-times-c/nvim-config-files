local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim' if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

use = require('packer').use
return require('packer').startup({function(use)

  -- TODO: pull into to its own file
    require('packer_compiled')
    use 'lewis6991/impatient.nvim'
    use {'5long/pytest-vim-compiler'}
    use {'wthollingsworth/pomodoro.nvim', requires = 'MunifTanjim/nui.nvim', cmd = { 'PomodoroStart', 'PomodoroStop', 'PomodoroStatus'}}
    -- TODO: think of a way to fix the lazy loading of this function within vim-test (function wrapper?)
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use {'tpope/vim-obsession', cmd = 'Obsession' }
    use { 'iamcco/markdown-preview.nvim', ft = 'markdown' }
    use {'wbthomason/packer.nvim'}
    use {'gennaro-tedesco/nvim-jqx', opt = true, filetype = 'json'}
    require('my_plugins/for/uxui')
    require('my_plugins/for/lsp')
    if vim.fn.has('Mac') == 1 then
  	require('my_plugins/for/treesitter')
    end
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
  end,
  config = {
  	compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})
