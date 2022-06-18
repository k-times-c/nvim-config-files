
-- local ls = require('luasnip')
-- ls.snippets = {
-- 	all = {
--  		ls.parser.parse_snippet("expand", "here your first snippet K!")
-- 	},
-- 	lua = {}
-- }

vim.keymap.set('n', "<space><space>s", function()
  local plenary_reload = require('plenary.reload')
  plenary_reload.reload_module("luasnip")
  -- packer_plugins["LuaSnip"].loaded = false
  require("packer").loader("LuaSnip")
  vim.cmd("source ~/.config/nvim/after/plugin/luasnip.lua")
end)

local ls = require('luasnip')

ls.add_snippets("all", {
	ls.parser.parse_snippet("expand", "here your first snippet K!"),
	ls.parser.parse_snippet("n", "somethin thing"),
	ls.parser.parse_snippet("j", "somethin thing"),
	ls.parser.parse_snippet("k", "somethin thing"),
})

