
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

-- Returns a snippet_node wrapped around an insert_node whose initial
-- text value is set to the current date in the desired format.

local date_input = function(args, state, fmt)
  local fmt = fmt or "%Y-%m-%d"
  return sn(nil, i(1, os.date(fmt)))
end

local snippets = {
    s("td", {
      t("today's date: "),
      d(1, date_input, {}, "%A, %B %d of %Y"),
      t(""),
    }),
    s("j", {t("{https://jira.nordstrom.com/browse/CREDIT-"), i(1, "###"), t("}")} ),
    s("wi", {t("+what is "), i(1), t("+")} )
}

return snippets
