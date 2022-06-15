-- vim.g.loaded_netrwPlugin = true
vim.g.loaded_tarPlugin         = true
vim.g.loaded_zipPlugin         = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.loaded_man               = true
vim.g.loaded_gzip              = true
vim.g.loaded_2html_plugin      = true
vim.g.loaded_matchparen        = true
vim.g.loaded_matchit           = true
vim.g.syntax_on                = true
vim.o.swapfile                 = false
vim.o.hidden                   = true
vim.o.wrap                     = false
vim.o.ruler                    = true
vim.go.path                    = ".,,**3"
vim.o.encoding                 = "utf8"
--Incremental live completion (note: this is now a default on master)
-- vim.o.inccommand = 'nosplit'

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

--Enable relative number
vim.o.relativenumber = false

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.o.history = 700
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
-- vim.g.onedark_terminal_italics = 2

-- add list symbols
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:remove("tab:>")
-- vim.opt.listchars:append("tab:»")
-- vim.opt.listchars.set('eol:↲,tab:»,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣')

local group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost",
  { pattern = "*",
    callback = function() vim.highlight.on_yank() end,
    group = group
  })
vim.o.wildignore = "**/node_modules/**,**/dist/**,*.pyc,*__pycache__/**,**/venv/**,.DS_Store*"

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end


return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', config = function()
    vim.keymap.set('n', '<leader>p ', ':Packer ')
    vim.keymap.set('n', '<leader>pl', ':PackerLoad ')
    vim.keymap.set('n', '<leader>ps', '<cmd>PackerStatus<cr>')
    vim.keymap.set('n', '<leader>py', ':PackerSync<cr>')
    vim.keymap.set('n', '<leader>pc', ':PackerCompile<cr>')
    vim.keymap.set('n', '<leader>pu', ':PackerUpdate<cr>')
    vim.keymap.set('n', '<leader>pp', ':PackerProfile<cr>')
  end
  }

  use { 'bronson/vim-visual-star-search', opt = true, keys = { '#', ' #', '*', '<leader>*' } }
  use { 'andymass/vim-matchup', keys = "%" }
  use { 'gennaro-tedesco/nvim-jqx', opt = true, filetype = 'json' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-abolish', cmd = { "Subvert", "Abolish", "S" } }
  use { "tpope/vim-repeat", keys = '.' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { 'nvim-treesitter/nvim-treesitter-context', after = "nvim-treesitter", disable = true },
      { 'nvim-treesitter/nvim-treesitter-refactor' },
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "python", "norg" },
        matchup = { enable = true },
        highlight = { enable = true },
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
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
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
        }
      }
      vim.o.foldmethod = 'expr'
      vim.o.foldlevel = 99
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  }
  use { 'L3MON4D3/LuaSnip' }
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim',
      "petertriho/cmp-git",
      -- completion engine
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- TODO: add nvim-cmp
      vim.o.completeopt = 'menu,menuone,noselect'
      local cmp = require 'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })


      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline', keyword_pattern = [=[[^[:blank:]\!]*]=] }
        })
      })
    end
  }

  use { 'mfussenegger/nvim-dap',
    ft = "python",
    requires = {
      { "rcarriga/nvim-dap-ui",
        opt = true,
        requires = "mfussenegger/nvim-dap"
      },
      { "nvim-telescope/telescope-dap.nvim",
        opt = true,
        requires = {
          "mfussenegger/nvim-dap",
          "nvim-telescope/telescope.nvim"
        },
        config = function() require("telescope").load_extension("dap") end
      },
      { "theHamsta/nvim-dap-virtual-text",
        opt = true,
        requires = "mfussenegger/nvim-dap",
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup()
          -- TODO: try removing the inline function to just putting the method reference
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end
      },
      { "mfussenegger/nvim-dap-python",
        opt = true,
        config = function()
          print("nvim-dap-python config initialated")
          local dappython = require('dap-python')
          dappython.setup('/Users/kyleclark/.virtualenvs/debugpy/bin/python')
          dappython.test_runner = 'pytest'
        end
      }
    },
    config = function()
      print("nvim-dap config initialated")
      if not packer_plugins["nvim-dap-python"].loaded then
        require("packer").loader("nvim-dap-python")
      end
      if not packer_plugins["nvim-dap-ui"].loaded then
        require("packer").loader("nvim-dap-ui")
      end
      if not packer_plugins["nvim-dap-virtual-text"].loaded then
        require("packer").loader("nvim-dap-virtual-text")
      end
      if not packer_plugins["telescope-dap.nvim"].loaded then
        require("packer").loader("telescope-dap.nvim")
      end

      -- dap.adapters.python = {
      --   type = 'executable';
      --   command = '/Users/kyleclark/.virtualenvs/debugpy/bin/python';
      --   args = { '-m', 'debugpy.adapter' };
      -- }
      --
      -- dap.configurations.python = {
      --   {
      --     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      --     request = 'launch';
      --     name = "Launch file";
      --
      --     program = "${file}";
      --     pythonPath = function()
      --       local cwd = vim.fn.getcwd()
      --       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
      --         return cwd .. '/venv/bin/python'
      --       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
      --         return cwd .. '/.venv/bin/python'
      --       else
      --         return '/usr/bin/python'
      --       end
      --     end;
      --   },
      -- }

    end,
    after = { "telescope.nvim" },
  }

  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
      local telescope = require "telescope"
      telescope.setup {}
      telescope.load_extension "fzf"
      telescope.load_extension "file_browser"

      -- vim.api.nvim_set_keymap('n', "<leader>fl", "<cmd>Telescope buffers<cr>", opts)
    end
  }
  use { "milisims/nvim-luaref" }
  use { "neovim/nvim-lspconfig",
    config = function()
      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '>d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
      end

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      require('lspconfig')['pyright'].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      require 'lspconfig'.sumneko_lua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
              neededFileStatus = {
                ["codestyle-check"] = "Any",
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
            format = {
              enable = true,
              -- Put format options here
              -- NOTE: the value should be STRING!!
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              }
            },
          },
        },
      }
    end
  }
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  use { "nvim-neotest/neotest",
    ft = "python",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "antoinemadec/FixCursorHold.nvim", opt = true },
      { "nvim-neotest/neotest-python", opt = true }
    },
    config = function()
      if not packer_plugins["FixCursorHold.nvim"].loaded then
        require("packer").loader("FixCursorHold.nvim")
      end
      if not packer_plugins["neotest-python"].loaded then
        require("packer").loader("neotest-python")
      end
      require("neotest").setup({
        adapters = {
          require("neotest-python") {
            runner = "pytest",
          }
        }
      })
    end
  }
  use { 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
