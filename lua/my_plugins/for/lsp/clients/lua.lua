
local p = {}
	-- Example custom server
if vim.fn.has('Mac') == 1 then
	p.sumneko_root_path = vim.fn.getenv 'HOME' .. '/Developer/lua-language-server' -- Change to your sumneko root installation
	p.sumneko_binary = p.sumneko_root_path .. '/bin/macOS/lua-language-server'
else
	p.sumneko_root_path = vim.fn.getenv 'HOME' .. '/Development/support_tools/lsp_source_code/lua-language-server' -- Change to your sumneko root installation
	p.sumneko_binary = p.sumneko_root_path .. '/bin/Windows/lua-language-server.exe'
end

local on_attach = require('my_plugins/for/lsp/clients/my-general-lsp-settings')
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').sumneko_lua.setup {

  cmd = { p.sumneko_binary, '-E', p.sumneko_root_path .. '/main.lua' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
	-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	version = 'LuaJIT',
	-- Setup your lua path
	path = runtime_path,
      },
      diagnostics = {
	-- Get the language server to recognize the `vim` global
	globals = { 'vim' },
      },
      workspace = {
	-- Make the server aware of Neovim runtime files
	library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
	enable = false,
      },
    },
  },
}
