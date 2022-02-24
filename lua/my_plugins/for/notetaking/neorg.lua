use {
  "nvim-neorg/neorg",
  config = function()
    require('neorg').setup {
      -- Tell Neorg what modules to load
      load = {
            ["core.defaults"] = {},  -- Load all the default modules
            ["core.norg.completion"] = {
              config = {
                engine = "nvim-cmp"
              }
            },
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
              config = {
                workspaces = {
                  main = "~/Documents/neorg",
                  example_gtd_workspace = "~/Documents/example_workspaces/gtd",
                }
              }
            },
            ["core.presenter"] = {
              config = {
                zen_mode = 'truezen'
              },
            },
            ["core.keybinds"] = {
              config = {
                hook = function(keybinds)
                  keybinds.remap("norg", "n", "]h", "core.integrations.treesitter.next.heading")
                  keybinds.remap("norg", "n", "[h", "core.integrations.treesitter.previous.heading")
                  keybinds.remap_key("norg", "n", "<C-s>", "<leader>fs")
                  -- keybinds.map("norg", "n", "<leader>fo", "core.integrations.telescope.find_linkable")
                  keybinds.remap_key("norg", "n", "<C-Space>", "<C-CR>")
                end
              }
            },
            ["core.norg.journal"] = {
              config = {
                workspace = "main",
		journal_folder = "journal"
              },
            },
            ["core.norg.qol.toc"] = {},
            ["core.integrations.telescope"] = {},
            ["core.gtd.base"] = {
              config = {
                workspace = "main"
              }
           },
        }
      }
  end,
  requires = { "nvim-neorg/neorg-telescope", "nvim-lua/plenary.nvim" }
}

vim.api.nvim_set_keymap('n', '<leader>`n', '<cmd>edit ~/Documents/neorg/index.norg<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>o ', ':Neorg ', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>owm', '<cmd>Neorg workspace main<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ojj', '<cmd>Neorg journal today<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ojy', '<cmd>Neorg journal yesterday<cr>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ojt', '<cmd>Neorg journal tomorrow<cr>', { noremap = true})
