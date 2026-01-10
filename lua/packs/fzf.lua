vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		height = 0.40,
		width = 1.00,
		row = 1.00,
		border = "none",
		preview = {
			layout = "horizontal",
			border = "none",
			hidden = "nohidden",
		},
	},
	fzf_colors = {
		["bg"] = { "bg", "Normal" },
		["bg+"] = { "bg", "CursorLine" }, -- Highlighted line background
		["gutter"] = { "bg", "Normal" }, -- Removes the column on the left
		["pointer"] = { "bg", "CursorLine" }, -- Matches the selection bar
	},
	fzf_opts = {
		["--no-info"] = "",
		["--pointer"] = " ", -- Replace the '>' with a blank space
		["--marker"] = " ", -- Replace the multi-select marker with a blank space
	},
	defaults = {
		git_icons = false,
		file_icons = false,
	},
})

vim.keymap.set("n", "<leader>f", fzf.files, { desc = "search across all files" })
vim.keymap.set("n", "<leader>c", function()
	fzf.files({ cwd = "~/.config/nvim/" })
end, { desc = "search vim configurations" })
vim.keymap.set("n", "<leader>h", fzf.undotree, { desc = "browse current file changes" })
vim.keymap.set("n", "<leader>s", fzf.live_grep, { desc = "find term in current project" })
