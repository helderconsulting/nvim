vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { desc = "more info" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>r", ":update<cr> :source<cr>")
vim.keymap.set("n", "<A-(>", ":bp<cr>")
vim.keymap.set("n", "<A-)>", ":bn<cr>")
vim.keymap.set("n", "<A-d>", ":bd<cr>")
vim.keymap.set("n", "<A-D>", ":bd!<cr>")

local state = {
	open = false,
}
local function create_floating_menu()
	local original_window = vim.api.nvim_get_current_win()
	local buffer = vim.api.nvim_create_buf(false, true)
	local commands = {
		{
			label = "show info",
			action = vim.lsp.buf.hover,
		},
		{
			label = "show diagnostics",
			action = vim.diagnostic.open_float,
		},
		{
			label = "rename",
			action = vim.lsp.buf.rename,
		},
		{
			label = "code actions",
			action = vim.lsp.buf.code_action,
		},
	}
	local options = {}
	for _, command in ipairs(commands) do
		table.insert(options, command.label)
	end
	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, options)

	local width = 30
	local height = #commands
	local opts = {
		relative = "cursor",
		row = 1,
		col = 0,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buffer, true, opts)
	vim.keymap.set("n", "<Esc>", function()
		if state.open then
			vim.api.nvim_win_close(win, true)
		end
	end)
	vim.keymap.set("n", "<CR>", function()
		local line = vim.api.nvim_get_current_line()
		vim.api.nvim_win_close(win, true)
		state.open = false
		vim.schedule(function()
			if vim.api.nvim_win_is_valid(original_window) then
				vim.api.nvim_set_current_win(original_window)
			end
			for _, command in ipairs(commands) do
				if line == command.label then
					command.action()
				end
			end
		end)
	end, { buffer = buffer })
end
vim.keymap.set({ "n", "v" }, "<C-space>", function()
	state.open = true

	create_floating_menu()
end)
