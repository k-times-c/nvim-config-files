-- vim.g.loaded_netrwPlugin = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.loaded_man = true
vim.g.loaded_gzip = true
vim.g.loaded_2html_plugin = true
vim.g.loaded_matchparen = true
vim.g.loaded_matchit = true
vim.g.syntax_on = true
vim.o.swapfile = false
vim.o.hidden = true
vim.o.wrap = false
vim.o.ruler = true
-- vim.go.path                    = ".,,**3"
vim.o.encoding = "utf8"
vim.o.spell = true
vim.keymap.set("n", "<Space>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w><C-w>", "<nop>", { noremap = true, silent = true }) -- windows meta key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "gV", "`[v`]")

vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = "a" -- Enable mouse mode
vim.o.relativenumber = false
vim.o.breakindent = true --Enable break indent

--Save undo history
vim.opt.undofile = true
vim.o.history = 700

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true
-- vim.g.onedark_terminal_italics = 2

-- add list symbols
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:remove("tab:>")
-- vim.opt.listchars:append("tab:»"
-- vim.opt.listchars = { 'eol:↲', 'tab:»', 'trail:-', 'extends:<', 'precedes:>', 'conceal:┊', 'nbsp:␣' }

-- local lua_formatting = vim.api.nvim_create_augroup("Lua formatting", { clear = true })
-- vim.api.nvim_create_autocmd("VimBufEnter",
--     { pattern = "*.lua",
--         callback = function() vim.cmd( [[ set softtab ]]) end,
--     group = lua_formatting
--     })

vim.o.ls = 0
vim.o.ch = 0

vim.keymap.set("n", "j", "gj", { noremap = false, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = false, silent = true })

vim.keymap.set("t", "<M-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><C-w>l")

local group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = group,
})

vim.opt.wildignore = {
  "**/node_modules/**",
  "**/dist/**",
  "*.pyc",
  "*__pycache__/**",
  "**/venv/**",
  ".DS_Store*",
}

local fn = vim.fn
local packer_bootstrap = nil
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  use({
    "wbthomason/packer.nvim",
    config = function()
      vim.keymap.set("n", "<leader>p ", ":Packer ")
      vim.keymap.set("n", "<leader>pl", ":PackerLoad ")
      vim.keymap.set("n", "<leader>ps", "<cmd>PackerStatus<cr>")
      vim.keymap.set("n", "<leader>py", ":PackerSync<cr>")
      vim.keymap.set("n", "<leader>pC", ":PackerClean<cr>")
      vim.keymap.set("n", "<leader>pc", ":PackerCompile profile=true<cr>")
      vim.keymap.set("n", "<leader>pu", ":PackerUpdate<cr>")
      vim.keymap.set("n", "<leader>pp", ":PackerProfile<cr>")
    end,
  })
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
  -- use({
  --   "bronson/vim-visual-star-search",
  --   opt = true,
  --   keys = { "#", " #", "*", "<leader>*" },
  -- })
  use({ "andymass/vim-matchup", keys = "%" })
  use({ "gennaro-tedesco/nvim-jqx", opt = true, filetype = "json" })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })

  use({
    "tpope/vim-abolish",
    -- cmd = { "Subvert", "Abolish", "S" },
    -- keys = { "cr" },
  })

  use({ "tpope/vim-repeat", keys = "." })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        disable = true,
      },
      { "nvim-treesitter/nvim-treesitter-refactor", keys = "grr" },
      -- { 'RRethy/nvim-treesitter-endwise', ft = 'lua' },
      -- TODO: wrap config call to be ran at the correct time?
      {
        "RRethy/nvim-treesitter-textsubjects",
        keys = { "v", "<CR>" },
        config = "<cmd>e | normal gv<cr>",
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "norg", "query" },
        matchup = { enable = true },
        highlight = { enable = true },
        endwise = {
          enable = true,
        },
        playground = { enable = true },
        indent = { enable = true },
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
              -- TODO: inspect code to see if it's possible to make a "]D" plugin here
              list_definitions = "[D",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
        },
        textsubjects = {
          enable = true,
          prev_selection = ",", -- (Optional) keymap to select the previous selection
          keymaps = {
            [";"] = "textsubjects-smart",
            -- [";"] = "textsubjects-container-outer",
            ["i;"] = "textsubjects-container-inner",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["am"] = "@function.outer",
              ["im"] = "@function.inner",
              ["aM"] = "@class.outer",
              ["iM"] = "@class.inner",
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
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
      vim.o.foldmethod = "expr"
      vim.o.foldlevel = 99
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  })
  use({
    "L3MON4D3/LuaSnip", --[[ see after/plugin section for config  ]]
  })
  use({ "wellle/targets.vim" })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "onsails/lspkind-nvim",
      "petertriho/cmp-git",
      -- Completion engine
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- TODO: add nvim-cmp
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            elseif not cmp.abort() then
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ -- TODO: straighten out e mapping
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=] },
        }),
      })
    end,
  })
  use({
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  })
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "mfussenegger/nvim-dap",
      {
        "theHamsta/nvim-dap-virtual-text",
        requires = "mfussenegger/nvim-dap",
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup()
          -- TODO: try removing the inline function to just putting the method reference
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
      "jbyuki/one-small-step-for-vimkind",
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          local dap_python = require("dap-python")
          dap_python.setup("~/.virtualenvs/debugpy/bin/python")
          dap_python.test_runner = "pytest"
        end,
      },
    },
    config = function()
      local dap = require("dap")
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or 8086,
        })
      end
      -- if not packer_plugins["nvim-dap-python"].loaded then
      --   require("packer").loader("nvim-dap-python")
      -- end
      -- if not packer_plugins["nvim-dap-ui"].loaded then
      --   require("packer").loader("nvim-dap-ui")
      -- end
      -- if not packer_plugins["nvim-dap-virtual-text"].loaded then
      --   require("packer").loader("nvim-dap-virtual-text")
      -- end
      -- if not packer_plugins["telescope-dap.nvim"].loaded then
      --   require("packer").loader("telescope-dap.nvim")
      -- end
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local fb_actions = require("telescope").extensions.file_browser.actions
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
            mappings = {
              i = {
                ["<C-/>"] = "which_key",
                ["<C-h>"] = fb_actions.goto_home_dir,
                ["<C-.>"] = fb_actions.toggle_hidden,
                ["<C-y>"] = fb_actions.goto_parent_dir,
                ["<C-e>"] = { f = false },
                ["<C-g>"] = { f = false }
              },
            },
          },
        },
      })
      telescope.load_extension("fzf")
      require("telescope").load_extension("dap")
      telescope.load_extension("file_browser")
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser<cr>")
      vim.keymap.set("n", "<leader>fp", function()
        telescope.extensions.file_browser.file_browser({
          path = vim.fn.stdpath("data") .. "/site/pack/packer/start/",
        })
      end)
      vim.keymap.set("n", "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
      vim.keymap.set("n", "<leader>fls", "<cmd>Telescope buffers<cr>")
      vim.keymap.set("n", "<leader>f?", "<cmd>Telescope help_tags<cr>")
      vim.keymap.set("n", "<leader>f`", "<cmd>Telescope marks<cr>")
      vim.keymap.set("n", "<leader>fp", function()
        telescope.extensions.file_browser.file_browser({
          path = vim.fn.stdpath("data") .. "/site/pack/packer/start/",
        })
      end)
    end,
    cond = function() if vim.g.vscode then return false else return true end end
  })
  use({ "milisims/nvim-luaref" })
  use({ "williamboman/nvim-lsp-installer" })
  use({
    "neovim/nvim-lspconfig",
    after = "LuaSnip",
    config = function()
      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", ">d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "_d", vim.diagnostic.setloclist, opts)

      -- local lsp_formatting = function(bufnr)
      --   vim.lsp.buf.format({
      --     filter = function(client)
      --       -- apply whatever logic you want (in this example, we'll only use null-ls)
      --       return client.name == "null-ls"
      --     end,
      --     bufnr = bufnr,
      --   })
      -- end

      -- if you want to set up formatting on save, you can use this as a callback
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end

        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        -- vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.format")
        local filetype = vim.api.nvim_buf_get_option(0, "filetype")

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>gi", vim.lsp.buf.implementation, bufopts)
        if filetype ~= "lua" then
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        end
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>gt", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set({ "n", "v" }, "gq", vim.lsp.buf.format, bufopts)
      end
      -- Add additional capabilities supported by nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local lsp = require("lspconfig")
      lsp.vimls.setup({
        on_attach = on_attach, -- require("aerial").on_attach,
        capabilities = capabilities,
      })
      require("lspconfig")["pyright"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").sumneko_lua.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
              -- neededFileStatus = {
              --   ["codestyle-check"] = "Any",
              -- },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            -- format = {
            --   enable = true,
            -- Put format options here
            -- NOTE: the value should be STRING!!
            -- defaultConfig = {
            --   indent_style = "space",
            --   indent_size = "2",
            -- }
            -- },
          },
        },
      })
    end,
  })

  -- use({
  --   "glacambre/firenvim",
  --   run = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  --   config = function()
  --     vim.g.firenvim_config = {
  --       globalSettings = {
  --         ['.*'] = {
  --           alt = 'all',
  --         },
  --         localSettings = {
  --           ['.*'] = {
  --             takeover = 'never',
  --           },
  --         },
  --       },
  --     }
  --   end
  -- })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    "nvim-neotest/neotest",
    -- ft = { "python", "lua" },
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "antoinemadec/FixCursorHold.nvim", --[[ , opt = true  ]]
      },
      {
        "nvim-neotest/neotest-python", --[[ , ft = "python"  ]]
      },
      {
        "nvim-neotest/neotest-plenary", --[[ , ft = "lua"  ]]
      },
    },
    config = function()
      -- local plugins = {
      --   "FixCursorHold.nvim",
      --   -- "neotest-plenary",
      --   "neotest-python",
      --   "nvim-dap",
      -- }
      -- for _, plugin_name in ipairs(plugins) do
      --   if not packer_plugins[plugin_name].loaded then
      --     require("packer").loader(plugin_name)
      --   end
      -- end
      neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-python")({
            runner = "pytest",
            -- dap = { justMyCode = false },
          }),
          require("neotest-plenary"),
          -- require("neotest-vim-test")({
          --   ignore_file_types = { "python", "vim", "lua" },
          -- }),
        },
      })

      --key maps
      vim.keymap.set("n", "t<C-n>", neotest.run.run)
      vim.keymap.set("n", "t<C-l>", neotest.run.run_last)
      vim.keymap.set("n", "t<C-f>", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end)
    end,
  })
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    config = function()
      local neogit = require("neogit")
      neogit.setup({})
    end,
  })

  use({
    "AndrewRadev/splitjoin.vim",
    keys = { "gJ", "gS" },
  })

  use({ "tommcdo/vim-exchange", keys = { { "n", "cx" }, { "v", "X" } } })
  use({ "AndrewRadev/switch.vim", keys = { "gs" } })
  use({ "tpope/vim-speeddating", keys = { "<c-a>", "<c-x>" } })
  use({
    "nvim-neorg/neorg",
    -- ft = "norg",
    -- after = "nvim-treesitter",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/Documents/notes/interview_prep",
                home = "~/Documents/notes/home",
              },
            },
          },
          ["core.norg.concealer"] = {},
          ["core.export.markdown"] = {},
          ["core.norg.journal"] = {},
          ["core.norg.qol.toc"] = {},
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      })
      -- vim.keymap.set("n", ":NeorgStart ", function()
    end,
    requires = "nvim-lua/plenary.nvim",
  })
  use({
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      local catppuccin = require("catppuccin")
      catppuccin.setup({
        transparent_background = true,
        compile = { enable = true },
        neogit = true,
        which_key = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
      })
      vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
      vim.cmd([[colorscheme catppuccin]])
    end,
  })
  use({
    "rcarriga/nvim-notify",
    opt = true,
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
      })
    end,
  })

  use({
    "folke/lua-dev.nvim", --[[ ,
    config = function()
      require("lua-dev").setup({
        library = { plugins = { "neotest" }, types = true },
      })
    end, ]]
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end

          -- Navigation
          map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
          map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

          -- Actions
          map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
          map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
          map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
          map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
          map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
          map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
          map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
          map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
          map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

          -- Text object
          map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
          map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  })

  use({ "ThePrimeagen/refactoring.nvim" }) -- Automatically set up your configuration after cloning packer.nvim; -- Put this at the end after all plugins; if packer_bootstrap then; require("packer").sync() end

  use({
    "danymat/neogen",
    cmd = { "Neogen" },
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  })

  use({ "tweekmonster/helpful.vim", cmd = "HelpfulVersion" })

  use({
    "ThePrimeagen/harpoon",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      })
      require("telescope").load_extension("harpoon")
      vim.keymap.set("n", "mh", function()
        require("harpoon.mark").add_file()
      end)
      vim.keymap.set("n", "<leader>h", function()
        require("harpoon.ui").toggle_quick_menu()
      end)
      vim.keymap.set("n", "[h", function()
        require("harpoon.ui").nav_prev()
      end)
      vim.keymap.set("n", "]h", function()
        require("harpoon.ui").nav_next()
      end)
      vim.keymap.set("n", "<leader>f<C-h>", "<Cmd>Telescope harpoon marks<CR>")
      vim.keymap.set("n", "g<C-h>", function()
        require("harpoon.ui").nav_file(vim.v.count1)
      end)
    end,
    after = "telescope.nvim",
  })
end)

-- TODO: make an autocmd or make a file to set the lua tab widths
-- local lspconfig_util = require("lspconfig.util")
-- local root_finder = lspconfig_util.root_pattern(".git")
-- vim.pretty_print(lspconfig_util.root_pattern(".git")("/Users/kyleclark/.config/nvim/init.lua"))
-- there is also find_git_ancestor(startpath)
