local ok, treesitter = pcall(require,"nvim-treesitter.configs") 

if ok then
	treesitter.setup({
		ensure_installed = {
			"help", "javascript", "typescript", "c", "lua", "rust"
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		}
	})
end
