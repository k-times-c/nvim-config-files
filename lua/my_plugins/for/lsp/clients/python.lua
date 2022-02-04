local nvim_lsp = require('lspconfig')
local on_attach = require('my_plugins/for/lsp/clients/my-general-lsp-settings')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
  on_attach = on_attach,
  capabilities = capabilities,
}
