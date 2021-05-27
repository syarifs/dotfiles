require('lspconfig').pyls.setup {
	cmd = {"pylsp"},
	plugins = {
		pylint = {
			enable = true,
			args = {"--generate-members"}
		}
	}
}
