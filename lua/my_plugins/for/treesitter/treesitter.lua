
use {'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-textobjects",
    'nvim-treesitter/nvim-treesitter-refactor'
  },
  config = function()
    if vim.fn.has('Mac') == 0 then
      require 'nvim-treesitter.install'.compilers = { "clang" }
    else
      -- require 'nvim-treesitter.install'.compilers = { "gcc" }
      -- require 'nvim-treesitter.install'.prefer_git = true
    end

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
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["am"] = "@function.outer",
            ["im"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ag"] = "@comment.inner",
            ["ig"] = "@comment.outer",
            -- ["ib"] = "@block.inner",
            -- ["ab"] = "@block.outer",
            ["i^"] = "@call.inner",
            ["a^"] = "@call.outer",
            ["ii"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["if"] = "@frame.inner",
            ["af"] = "@frame.outer",
            ["io"] = "@loop.inner",
            ["ao"] = "@loop.outer",
            ["ir"] = "@parameter.inner",
            ["or"] = "@parameter.outer",
            ["iN"] = "@scopename.inner",
            ["as"] = "@statement.outer"
            -- Or you can define your own textobjects like this
            -- ["iF"] = {
            --   lua = "(function_definition) @function",
            --   python = "(function_definition) @function",
            --   cpp = "(function_definition) @function",
            --   c = "(function_definition) @function",
            --   java = "(method_declaration) @function",
            -- },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
            ["]gc"] = "@comment.outer",
            ["]o"] = "@loop.outer",
            ["]i"] = "@conditional.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
            ["]gC"] = "@comment.outer",
            ["]O"] = "@loop.outer",
            ["]I"] = "@conditional.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
            ["[gc"] = "@comment.outer",
            ["[o"] = "@loop.outer",
            ["[i"] = "@conditional.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
            ["[gC"] = "@comment.outer",
            ["[O"] = "@loop.outer",
            ["[I"] = "@conditional.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
      refactor = {
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
       },
        navigation = {
         enable = true,
         keymaps = {
           goto_definition_lsp_fallback = "gd",
           list_definitions = "[D",
           list_definitions_toc = "gO",
           goto_next_usage = "]i",
           goto_previous_usage = "[i",
         },
       },
      },
      textsubjects = {
        enable = true,
        prev_selection = '<S-CR>', -- (Optional) keymap to select the previous selection
        keymaps = {
          ['<CR>'] = 'textsubjects-smart',
          ['a<CR>'] = 'textsubjects-container-outer',
          ['i<CR>'] = 'textsubjects-container-inner',
        },
      },
    }
    vim.o.foldmethod = 'expr'
    vim.o.foldlevel = 99
  end
}
-- use { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' }
