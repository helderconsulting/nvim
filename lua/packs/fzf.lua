vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")
fzf.setup({
	file_ignore_patterns = {
		"node_modules/",
		"dist/",
		".next/",
		".git/",
		".gitlab/",
		"build/",
		"target/",
		"package-lock.json",
		"pnpm-lock.yaml",
		"yarn.lock",
	},
	winopts = {
		height = 0.40,
		width = 1.00,
		row = 1.00,
		border = "none",
		preview = {

			border = "none",
			hidden = "nohidden",
		},
	},
	fzf_colors = {
		["bg"] = { "bg", "Normal" },
		["bg+"] = { "bg", "CursorLine" }, -- Highlighted line background

		["pointer"] = { "bg", "CursorLine" }, -- Matches the selection bar
	},
	fzf_opts = {
		["--no-info"] = "",
		["--pointer"] = " ",
		["--marker"] = " ",
	},
	defaults = {
		git_icons = false,
		file_icons = false,
	},
})
vim.keymap.set("n", "<leader>f", fzf.files, { desc = "search across all files" })
vim.keymap.set("n", "<leader>F", fzf.grep_cword, { desc = "search word across all files" })
vim.keymap.set("n", "<leader>B", fzf.buffers, { desc = "search in buffers" })
vim.keymap.set("n", "<leader>c", function()
	fzf.files({ cwd = "~/.config/nvim/" })
end, { desc = "search vim configurations" })
vim.keymap.set("n", "<leader>h", fzf.undotree, { desc = "browse current file changes" })
vim.keymap.set("n", "<leader>s", fzf.live_grep_native, { desc = "find term in current project" })
