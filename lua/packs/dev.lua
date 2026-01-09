vim.pack.add({ "https://github.com/helderconsulting/action-menu.nvim" })

local ok, tokyonight = pcall(require, "tokyonight.colors")

if ok then
	local colors = tokyonight.setup()
	require("action_menu").setup({
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
				label = "rename...",
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
		colors = {
			key = {
				fg = colors.fg_sidebar,
				bg = colors.blue0,
			},
			label = {
				fg = colors.fg,
				bg = colors.bg_dark,
			},
		},
	})
end
