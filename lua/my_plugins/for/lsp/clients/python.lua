
local nvim_lsp = require('lspconfig')
local on_attach = require('my_plugins/for/lsp/clients/my-general-lsp-settings')
-- Enable the following language servers
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require'lspconfig'.pylsp.setup{
	cmd = { "pyls" },
}

