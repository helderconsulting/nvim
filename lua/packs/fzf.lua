vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>f", fzf.files, { desc = "search across all files" })
vim.keymap.set("n", "<leader>c", function()
	fzf.files({ cwd = "~/.config/nvim/" })
end, { desc = "search vim configurations" })
vim.keymap.set("n", "<leader>h", fzf.undotree, { desc = "browse current file changes" })
vim.keymap.set("n", "<leader>s", fzf.live_grep, { desc = "find term in current project" })
