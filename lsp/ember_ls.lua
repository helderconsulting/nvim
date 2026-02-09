vim.filetype.add({
	extension = {
		hbs = "handlebars",
		handlebars = "handlebars",
		mustache = "handlebars",
		moustache = "handlebars",
	},
})

---@type vim.lsp.Config
return {
	cmd = { "ember-language-server", "--stdio" },
	filetypes = { "handlebars" },
	root_markers = { "ember-cli-build.js", ".git" },
}
