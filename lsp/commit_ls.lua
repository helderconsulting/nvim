---@type vim.lsp.Config
return {
	cmd = { "commit-lsp", "run" },
	root_markers = { ".git" },
	filetypes = { "gitcommit" },
}
