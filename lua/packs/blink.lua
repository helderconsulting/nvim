 vim.pack.add({
	"https://github.com/Saghen/blink.cmp",
})
require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	appearance = {
		use_nvim_cmp_as_default = true,
	},
	completion = {
		documentation = { auto_show = false },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
