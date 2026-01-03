vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
})
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

vim.keymap.set("n", "<leader>l", function()
	require("mason.ui").open()
end, { desc = "Open language tools" })
