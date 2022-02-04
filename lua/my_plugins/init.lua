local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

use = require('packer').use
return require('packer').startup({function(use)

  -- TODO: pull into to its own file
    vim.api.nvim_set_keymap('n', '<leader>p ', ':Packer ', { noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>pl', ':PackerLoad ', { noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>ps', '<cmd>PackerStatus<cr>', { noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>py', ':PackerSync<cr>', { noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>pc', ':PackerCompile<cr>', { noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>pu', ':PackerUpdate<cr>', { noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>pp', ':PackerProfile<cr>', { noremap = true})
    require('packer_compiled')
    use 'lewis6991/impatient.nvim'
    use {'5long/pytest-vim-compiler'}
    use {'sheerun/vim-polyglot', opt = true}
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      },
      config = function()
        require('refactoring').setup({})
        -- Remaps for each of the four debug operations currently offered by the plugin
        vim.api.nvim_set_keymap("v", "<Leader>re", [[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "<Leader>rv", [[ <Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "<Leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], { noremap = true, silent = true })
    end
    }
    use {'wthollingsworth/pomodoro.nvim', requires = 'MunifTanjim/nui.nvim', cmd = { 'PomodoroStart', 'PomodoroStop', 'PomodoroStatus'}}
    -- TODO: think of a way to fix the lazy loading of this function within vim-test (function wrapper? // after keyword)
    use { 'akinsho/toggleterm.nvim',
        config = function()
          require("toggleterm").setup{
            open_mapping = '<c-_>',
          }
          -- vim.api.nvim_set_keymap('n', '<C-_>', '<cmd>ToggleTerm<cr>', { noremap = true } )
          -- vim.api.nvim_set_keymap('t', '<C-_>', '<cmd>ToggleTerm<cr>', { noremap = true } )
        end
    }
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
    use {'tpope/vim-obsession', cmd = 'Obsession' }
    use { 'iamcco/markdown-preview.nvim', ft = 'markdown' }
    --TODO: add packer remaps to the config function
    use {'wbthomason/packer.nvim'}
    use {'gennaro-tedesco/nvim-jqx', opt = true, filetype = 'json'}
    use {'bronson/vim-visual-star-search', opt = true, keys = {'#', ' #', '*', ' *'} }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function()
        require'nvim-tree'.setup {}
        vim.api.nvim_set_keymap('n', '||', '<cmd>NvimTreeToggle<cr>', { noremap = true})
      end
    }

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
  end,
  config = {
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})
