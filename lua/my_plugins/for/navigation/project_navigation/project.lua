  use {
    "ahmedkhalf/project.nvim",
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension('projects')
      require("project_nvim").setup {
	detection_methods = { '=omniFileTransfer', '=s3-integration', 'lsp', 'pattern' }
      }
    end
  }
