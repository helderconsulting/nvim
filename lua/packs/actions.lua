vim.pack.add({ "https://github.com/helderconsulting/action-menu.nvim" })
local ok, tokyonight = pcall(require, "tokyonight.colors")

if ok then
	local colors = tokyonight.setup()
	local action_menu_ok, action_menu = pcall(require, "action_menu")
	if action_menu_ok then
		action_menu.setup({
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
			colors = {
				key = {
					fg = colors.fg,
					bg = colors.bg_dark,
				},
				label = {
					fg = colors.bg_dark,
					bg = colors.hint,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<C-space>", action_menu.open)
		vim.keymap.set("n", "<Esc>", action_menu.close)
		vim.keymap.set("n", "<cr>", action_menu.select)
	end
end
