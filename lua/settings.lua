-- disable runtime plugins
-- loaded_marks          #1
-- loaded_catppuccino    #1
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true
-- loaded_spellfile_plugin #1
vim.g.loaded_tutor_mode_plugin = true
-- vim.g.loaded_netrwPlugin = true
-- loaded_shada_plugin   #1
vim.g.loaded_man = true
vim.g.loaded_gzip = true
vim.g.loaded_2html_plugin = true
vim.g.loaded_matchparen = true
vim.g.loaded_matchit    = true
-- loaded_remote_plugins  C:\Users\gruq\AppData\Local\nvim-data/rplugin.vim

vim.o.hidden = true
vim.o.wrap = false
vim.o.ruler = true
vim.o.wildignore = "**/node_modules/**,**/dist/**,*.pyc,*__pycache__/**,**/venv/**"
vim.go.path = ".,,**3"
vim.o.encoding = "utf8"
vim.o.guifont = "Droid Sans Mono for Powerline Plus Nerd File Types 11"
--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.o.history=700
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2

-- add list symbols
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tab:»")
-- vim.opt.listchars.set('eol:↲,tab:»,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣')

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)