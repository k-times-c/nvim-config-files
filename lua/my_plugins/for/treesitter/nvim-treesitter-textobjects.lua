use { "nvim-treesitter/nvim-treesitter-textobjects", -- opt = true }
  config = function()
    require'nvim-treesitter.configs'.setup {
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
    }
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'treesitter#foldexpr()'
  end
}
