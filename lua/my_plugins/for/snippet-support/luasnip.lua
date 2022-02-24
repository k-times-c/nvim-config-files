use 'rafamadriz/friendly-snippets'
use {'L3MON4D3/LuaSnip',
  config = function()
    local types = require("luasnip.util.types")
    require'luasnip'.config.setup({
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = {{"●", "GruvboxOrange"}}
          }
        },
        [types.insertNode] = {
          active = {
            virt_text = {{"●", "GruvboxBlue"}}
          }
        }
      },
    })

  end
}

local luasnip = require("luasnip")

function _G.snippets_clear()
  for m, _ in pairs(luasnip.snippets) do
    package.loaded["snippets."..m] = nil
  end
  luasnip.snippets = setmetatable({}, {
    __index = function(t, k)
      local ok, m = pcall(require, "snippets." .. k)
      if not ok and not string.match(m, "^module.*not found:") then
        error(m)
      end
      t[k] = ok and m or {}
      return t[k]
    end
  })
end

_G.snippets_clear()

local snippet_dir = vim.fn.stdpath('config') .. "/lua/snippets/"
local autocommand = [[
augroup snippets_clear
au!
au BufWritePost ]] .. snippet_dir .. [[*.lua lua _G.snippets_clear()
augroup END
]]
vim.cmd(autocommand)

function _G.edit_ft()
  -- returns table like {"lua", "all"}
  local fts = require("luasnip.util.util").get_snippet_filetypes()
  vim.ui.select(fts, {
    prompt = "Select which filetype to edit:"
  }, function(item, idx)
    -- selection aborted -> idx == nil
    if idx then
      vim.cmd("edit " .. snippet_dir ..item..".lua")
    end
  end)
end

vim.cmd [[command! LuaSnipEdit :lua _G.edit_ft()]]

