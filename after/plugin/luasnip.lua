vim.keymap.set(
  "n",
  "<space><space>s",
  "<cmd>update ~/.config/nvim/after/plugin/luasnip.lua | source   ~/.config/nvim/after/plugin/luasnip.lua | LuaSnipListAvailable<cr>"
)

local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true })
local ls = require("luasnip")

local function simple_restore(args, _)
  return ls.sn(nil, { ls.i(1, args[1]), ls.r(2, "dyn", ls.i(nil, "user_text")) })
end

-- local function simple_restore(args, _)
--   return ls.sn(nil, { ls.i(1, args[1]), ls.i(2, "user_text") })
-- end
--
local snippet_collection = require("luasnip.session.snippet_collection")
snippet_collection.clear_snippets("lua")
ls.add_snippets("lua", {
  ls.parser.parse_snippet("j", "here $1 we are my ${2:friends}"),
  -- ls.parser.parse_snippet("j", "in west philadephia born and raise"),
  ls.s("t", {
    ls.i(1),
    ls.f(function(args)
      print("evalu")
      vim.pretty_print(args)
      -- vim.pretty_print(snip)
      -- vim.pretty_print(user_arg_1)
      return "[[[[[" .. args[1][1] .. "]]]]]"
    end, { 1 }, { user_args = { "Will be appended to text from i(0)" } }),
    -- ls.i(0)
  }),
  ls.s("k", {
    ls.t("text: "),
    ls.i(1),
    ls.t({ "", "copy: " }),
    ls.d(2, function(args)
      -- the returned snippetNode doesn't need a position; it's inserted
      -- "inside" the dynamicNode.
      return ls.sn(
        2,
        { ls.i(1, args[1]), ls.t({ "", "something else", "" }), ls.i(2), ls.t({ "", "hello" }) }
      )
    end, { 1 }),
  }),
  ls.s("p", {
    ls.c(1, {
      ls.sn(nil, { ls.t("("), ls.r(1, "it_diffrent"), ls.t(")") }),
      ls.sn(nil, { ls.t("["), ls.r(1, "it_diffrent"), ls.t("]") }),
      ls.sn(nil, { ls.t("{"), ls.r(1, "it_diffrent"), ls.t("}") }),
    }),
  }, {
    stored = {
      it_diffrent = ls.i(1, "default set"),
    },
  }),
  ls.s("rest", {
    ls.i(1, "preset"),
    ls.t({ "", "" }),
    ls.d(2, simple_restore, 1),
  }),
})
