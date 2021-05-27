local function activate(lsp)
	require('lspconfig')[lsp].setup{}
end

activate('clangd')
activate('html')
activate('cssls')
activate('tsserver')
activate('bashls')
activate('gopls')
activate('svelte')
activate('vuels')

require('lsp.lua-lsp')
require('lsp.pyls')
