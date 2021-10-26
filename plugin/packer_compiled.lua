-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/kyleclark/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/kyleclark/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/kyleclark/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/kyleclark/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/kyleclark/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  chadtree = {
    commands = { "CHADopen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/chadtree"
  },
  ["cmd-parser.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/cmd-parser.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/focus.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n‰\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20global_settings\1\0\0\1\0\3\21enter_on_sendcmd\1\19save_on_change\1\19save_on_toggle\1\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  kommentary = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["marks.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/marks.nvim"
  },
  ["material.vim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/material.vim"
  },
  neorg = {
    config = { "\27LJ\2\n¢\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0034\4\0\0=\4\t\0035\4\r\0005\5\v\0005\6\n\0=\6\f\5=\5\a\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0&~/.virtualenvs/debugpy/bin/python\nsetup\15dap-python\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nŽ\4\0\0\6\0\27\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\14\0004\4\5\0005\5\n\0>\5\1\0045\5\v\0>\5\2\0045\5\f\0>\5\3\0045\5\r\0>\5\4\4=\4\15\3=\3\16\0025\3\18\0005\4\17\0=\4\15\3=\3\19\0025\3\20\0005\4\22\0005\5\21\0=\5\23\4=\4\t\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\0\ttray\1\0\2\tsize\3\n\rposition\vbottom\1\2\0\0\trepl\fsidebar\relements\1\0\2\tsize\3(\rposition\tleft\1\0\2\tsize\4\0€€Àþ\3\aid\fwatches\1\0\2\tsize\4\0€€Àþ\3\aid\vstacks\1\0\2\tsize\4\0€€Àþ\3\aid\16breakpoints\1\0\2\tsize\4\0€€Àþ\3\aid\vscopes\rmappings\vexpand\1\0\4\tedit\6e\topen\6o\vremove\6d\trepl\6r\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\rexpanded\bâ–¾\14collapsed\bâ–¸\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n–\3\0\0\6\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0004\5\0\0=\5\r\4=\4\15\0035\4\16\0004\5\0\0=\5\r\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\tkeys\6n\1\0\3\npaste\6p\vselect\t<cr>\17paste_behind\6P\6i\1\0\0\vcustom\1\0\3\npaste\n<c-p>\vselect\t<cr>\17paste_behind\n<c-k>\ron_paste\1\0\1\fset_reg\1\fdb_path\31/databases/neoclip.sqlite3\tdata\fstdpath\afn\bvim\1\0\5\24content_spec_column\1\21default_register\6\"\fhistory\3è\a\30enable_persistant_history\1\fpreview\2\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\n™\a\0\0\a\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\23\0005\4\18\0005\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\24\0035\4\25\0005\5\26\0005\6\27\0=\6\28\5=\5\29\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\16textobjects\vselect\fkeymaps\aiF\1\0\4\vpython$(function_definition) @function\bcpp$(function_definition) @function\tjava#(method_declaration) @function\6c$(function_definition) @function\1\0\4\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\tswap\1\0\0\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\16lsp_interop\1\0\0\25peek_definition_code\1\0\2\15<leader>df\20@function.outer\15<leader>dF\17@class.outer\1\0\2\vborder\tnone\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    config = { "\27LJ\2\nˆ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\0\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    config = { "\27LJ\2\nZ\0\0\3\0\6\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\6\0\4\0X\1\1€L\0\2\0'\1\5\0L\1\2\0\014127.0.0.1\5\23Host [127.0.0.1]: \ninput\afn\bvimx\0\0\5\0\a\0\f6\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\0026\1\5\0\18\3\0\0'\4\6\0B\1\3\1L\0\2\0!Please provide a port number\vassert\vPort: \ninput\afn\bvim\rtonumber@\0\2\6\0\3\0\b\18\2\0\0005\4\0\0009\5\1\1=\5\1\0049\5\2\1=\5\2\4B\2\2\1K\0\1\0\tport\thost\1\0\1\ttype\vserverÄ\1\1\0\5\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\2\3\0005\3\4\0003\4\5\0=\4\6\0033\4\a\0=\4\b\3>\3\1\2=\2\3\0019\1\t\0003\2\v\0=\2\n\1K\0\1\0\0\tnlua\radapters\tport\0\thost\0\1\0\3\ttype\tnlua\tname&Attach to running Neovim instance\frequest\vattach\blua\19configurations\bdap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    commands = { ":TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\nù\2\0\0\6\0\18\1\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\0024\3\0\0=\3\t\0026\3\n\0009\3\v\0039\3\f\3'\5\r\0B\3\2\2=\3\14\0026\3\0\0'\5\15\0B\3\2\0029\3\16\3'\5\17\0B\3\2\0?\3\0\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\rdatapath\tdata\fstdpath\afn\bvim\17exclude_dirs\15ignore_lsp\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\3\0\0\blsp\fpattern\1\0\3\16show_hidden\1\16manual_mode\2\17silent_chdir\2\nsetup\17project_nvim\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["range-highlight.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/range-highlight.nvim"
  },
  ["shade.nvim"] = {
    config = { "\27LJ\2\nª\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\3\vtoggle\14<Leader>s\18brightness_up\v<C-Up>\20brightness_down\r<C-Down>\1\0\2\20overlay_opacity\0032\17opacity_step\3\1\nsetup\nshade\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/shade.nvim"
  },
  sniprun = {
    commands = { "SnipRun" },
    config = { "\27LJ\2\nÆ\4\0\0\5\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0024\3\0\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\2B\0\2\1K\0\1\0\18snipruncolors\26SniprunFloatingWinErr\1\0\2\fctermfg\fDarkRed\afg\f#881515\26SniprunVirtualTextErr\1\0\4\vcterfg\nBlack\afg\f#000000\fctermbg\fDarkRed\abg\f#881515\25SniprunFloatingWinOk\1\0\2\fctermfg\tCyan\afg\f#66eeff\25SniprunVirtualTextOk\1\0\0\1\0\4\vcterfg\nBlack\afg\f#000000\fctermbg\tCyan\abg\f#66eeff\19show_no_output\1\3\0\0\fClassic\23TempFloatingWindow\fdisplay\1\2\0\0\15NvimNotify\24interpreter_options\17repl_disable\16repl_enable\26selected_interpreters\1\0\2\20inline_messages\3\0\fborders\vsingle\nsetup\fsniprun\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/sniprun"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/sqlite.lua"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n \5\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\bï‘‰\nerror\bï™™\thint\bï µ\fwarning\bï”©\nother\bï« \16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\frefresh\6r\fpreview\6p\nhover\6K\rprevious\6k\19toggle_preview\6P\16toggle_mode\6m\tnext\6j\nclose\6q\vcancel\n<esc>\1\0\r\29use_lsp_diagnostic_signs\1\nicons\2\14fold_open\bï‘¼\14auto_open\1\16fold_closed\bï‘ \15auto_close\1\rposition\vbottom\14auto_fold\1\tmode\30lsp_workspace_diagnostics\17indent_lines\2\17auto_preview\2\vheight\3\n\nwidth\0032\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-fugitive"] = {
    commands = { "Git" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-ultest"] = {
    config = { "\27LJ\2\nÆ\1\0\1\b\0\t\1\0225\1\0\0)\2\1\0006\3\1\0009\3\2\3\18\5\1\0:\6\1\0B\3\3\2\15\0\3\0X\4\1€)\2\3\0008\3\2\0006\4\1\0009\4\3\4\18\6\0\0\22\a\0\2B\4\3\0025\5\a\0005\6\4\0=\3\5\6=\4\6\6=\6\b\5L\5\2\0\bdap\1\0\0\targs\vmodule\1\0\2\ttype\vpython\frequest\vlaunch\15list_slice\17tbl_contains\bvim\1\4\0\0\vpython\vpipenv\vpoetry\2›\1\1\0\6\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0006\3\3\0009\3\4\3'\5\5\0B\3\2\2>\3\1\0025\3\a\0003\4\6\0=\4\b\3=\3\n\2B\0\2\1K\0\1\0\rbuilders\1\0\0\18python#pytest\1\0\0\0\29let g:ultest_use_pty = 1\bcmd\bvim\nsetup\vultest\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n®\5\0\0\5\0#\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0005\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\3=\3\26\0025\3\27\0=\3\28\0025\3\30\0005\4\29\0=\4\31\0035\4 \0=\4!\3=\3\"\2B\0\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\vborder\tnone\rposition\vbottom\nicons\1\0\3\15breadcrumb\aÂ»\ngroup\6+\14separator\bâžœ\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\rtriggers\tauto\14show_help\2\19ignore_missing\1\fpresets\1\0\a\6g\2\fwindows\2\6z\2\bnav\2\17text_objects\2\fmotions\2\14operators\2\rspelling\1\0\2\16suggestions\3\20\fenabled\1\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/Users/kyleclark/.local/share/nvim/site/pack/packer/start/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n \5\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\bï‘‰\nerror\bï™™\thint\bï µ\fwarning\bï”©\nother\bï« \16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\frefresh\6r\fpreview\6p\nhover\6K\rprevious\6k\19toggle_preview\6P\16toggle_mode\6m\tnext\6j\nclose\6q\vcancel\n<esc>\1\0\r\29use_lsp_diagnostic_signs\1\nicons\2\14fold_open\bï‘¼\14auto_open\1\16fold_closed\bï‘ \15auto_close\1\rposition\vbottom\14auto_fold\1\tmode\30lsp_workspace_diagnostics\17indent_lines\2\17auto_preview\2\vheight\3\n\nwidth\0032\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n‰\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20global_settings\1\0\0\1\0\3\21enter_on_sendcmd\1\19save_on_change\1\19save_on_toggle\1\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0034\4\0\0=\4\t\0035\4\r\0005\5\v\0005\6\n\0=\6\f\5=\5\a\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<Leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\nŽ\4\0\0\6\0\27\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\14\0004\4\5\0005\5\n\0>\5\1\0045\5\v\0>\5\2\0045\5\f\0>\5\3\0045\5\r\0>\5\4\4=\4\15\3=\3\16\0025\3\18\0005\4\17\0=\4\15\3=\3\19\0025\3\20\0005\4\22\0005\5\21\0=\5\23\4=\4\t\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\0\ttray\1\0\2\tsize\3\n\rposition\vbottom\1\2\0\0\trepl\fsidebar\relements\1\0\2\tsize\3(\rposition\tleft\1\0\2\tsize\4\0€€Àþ\3\aid\fwatches\1\0\2\tsize\4\0€€Àþ\3\aid\vstacks\1\0\2\tsize\4\0€€Àþ\3\aid\16breakpoints\1\0\2\tsize\4\0€€Àþ\3\aid\vscopes\rmappings\vexpand\1\0\4\tedit\6e\topen\6o\vremove\6d\trepl\6r\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\rexpanded\bâ–¾\14collapsed\bâ–¸\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\nù\2\0\0\6\0\18\1\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\0024\3\0\0=\3\t\0026\3\n\0009\3\v\0039\3\f\3'\5\r\0B\3\2\2=\3\14\0026\3\0\0'\5\15\0B\3\2\0029\3\16\3'\5\17\0B\3\2\0?\3\0\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\rdatapath\tdata\fstdpath\afn\bvim\17exclude_dirs\15ignore_lsp\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\3\0\0\blsp\fpattern\1\0\3\16show_hidden\1\16manual_mode\2\17silent_chdir\2\nsetup\17project_nvim\frequire\3€€À™\4\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: vim-ultest
time([[Config for vim-ultest]], true)
try_loadstring("\27LJ\2\nÆ\1\0\1\b\0\t\1\0225\1\0\0)\2\1\0006\3\1\0009\3\2\3\18\5\1\0:\6\1\0B\3\3\2\15\0\3\0X\4\1€)\2\3\0008\3\2\0006\4\1\0009\4\3\4\18\6\0\0\22\a\0\2B\4\3\0025\5\a\0005\6\4\0=\3\5\6=\4\6\6=\6\b\5L\5\2\0\bdap\1\0\0\targs\vmodule\1\0\2\ttype\vpython\frequest\vlaunch\15list_slice\17tbl_contains\bvim\1\4\0\0\vpython\vpipenv\vpoetry\2›\1\1\0\6\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0006\3\3\0009\3\4\3'\5\5\0B\3\2\2>\3\1\0025\3\a\0003\4\6\0=\4\b\3=\3\n\2B\0\2\1K\0\1\0\rbuilders\1\0\0\18python#pytest\1\0\0\0\29let g:ultest_use_pty = 1\bcmd\bvim\nsetup\vultest\frequire\0", "config", "vim-ultest")
time([[Config for vim-ultest]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n–\3\0\0\6\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0004\5\0\0=\5\r\4=\4\15\0035\4\16\0004\5\0\0=\5\r\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\tkeys\6n\1\0\3\npaste\6p\vselect\t<cr>\17paste_behind\6P\6i\1\0\0\vcustom\1\0\3\npaste\n<c-p>\vselect\t<cr>\17paste_behind\n<c-k>\ron_paste\1\0\1\fset_reg\1\fdb_path\31/databases/neoclip.sqlite3\tdata\fstdpath\afn\bvim\1\0\5\24content_spec_column\1\21default_register\6\"\fhistory\3è\a\30enable_persistant_history\1\fpreview\2\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n®\5\0\0\5\0#\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0005\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\3=\3\26\0025\3\27\0=\3\28\0025\3\30\0005\4\29\0=\4\31\0035\4 \0=\4!\3=\3\"\2B\0\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\vborder\tnone\rposition\vbottom\nicons\1\0\3\15breadcrumb\aÂ»\ngroup\6+\14separator\bâžœ\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\rtriggers\tauto\14show_help\2\19ignore_missing\1\fpresets\1\0\a\6g\2\fwindows\2\6z\2\bnav\2\17text_objects\2\fmotions\2\14operators\2\rspelling\1\0\2\16suggestions\3\20\fenabled\1\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\n™\a\0\0\a\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\23\0005\4\18\0005\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\24\0035\4\25\0005\5\26\0005\6\27\0=\6\28\5=\5\29\4=\4\30\3=\3\31\2B\0\2\1K\0\1\0\16textobjects\vselect\fkeymaps\aiF\1\0\4\vpython$(function_definition) @function\bcpp$(function_definition) @function\tjava#(method_declaration) @function\6c$(function_definition) @function\1\0\4\aic\17@class.inner\aif\20@function.inner\aac\17@class.outer\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\tswap\1\0\0\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\16lsp_interop\1\0\0\25peek_definition_code\1\0\2\15<leader>df\20@function.outer\15<leader>dF\17@class.outer\1\0\2\vborder\tnone\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: nvim-ts-rainbow
time([[Config for nvim-ts-rainbow]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\0\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-rainbow")
time([[Config for nvim-ts-rainbow]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined :TSPlaygroundToggle ++once lua require"packer.load"({'playground'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CHADopen lua require("packer.load")({'chadtree'}, { cmd = "CHADopen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'one-small-step-for-vimkind'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-dap-python'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
