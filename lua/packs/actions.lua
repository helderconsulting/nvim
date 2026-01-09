vim.pack.add({ "https://github.com/helderconsulting/action-menu.nvim" })

require("action_menu.nvim").setup({
	commands = {
		{
			key = "i",
			label = "show info",
			action = vim.lsp.buf.hover,
		},
		{
			key = "d",
			label = "show diagnostics",
			action = vim.diagnostic.open_float,
		},
		{
			key = "r",
			label = "rename",
			action = vim.lsp.buf.rename,
		},
		{
			key = "a",
			label = "code actions",
			action = vim.lsp.buf.code_action,
		},
	},
	keymaps = {
		open_menu = {
			mode = { "n", "v" },
			lhs = "<C-space>",
		},
		close_menu = {
			mode = "n",
			lhs = "<Esc>",
		},
		select_item = {
			mode = "n",
			lhs = "<cr>",
		},
	},
}
