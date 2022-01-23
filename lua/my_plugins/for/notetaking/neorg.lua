use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.norg.completion"] = {
                        config = {
                                engine = "nvim-cmp"
                        }
                },
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.defaults"] = {},  -- Load all the default modules
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/Documents/neorg"
                        }
                    }
                },
                ["core.keybinds"] = { -- Configure core.keybinds
                    config = {
                        default_keybinds = true, -- Generate the default keybinds
                        neorg_leader = "<Leader>o" -- This is the default if unspecified
                    }
                },
                ["core.norg.journal"] = {}
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim"
}
