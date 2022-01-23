
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
  config = function()
    if vim.fn.has('Mac') == 0 then
      require 'nvim-treesitter.install'.compilers = { "clang" }
    end
    -- require 'nvim-treesitter.install'.prefer_git = true

    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

    parser_configs.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main"
        },
    }

    parser_configs.norg_meta = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
            files = { "src/parser.c" },
            branch = "main"
        },
    }

    parser_configs.norg_table = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
            files = { "src/parser.c" },
            branch = "main"
        },
    }

    require('nvim-treesitter.configs').setup {
      ensure_installed = {'python', 'go', 'bash', 'lua', --[[ "norg", "norg_meta", "norg_table" ]]},
      highlight = {
        enable = true,
      },
    }
  end
}
-- use { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' }
