vim.pack.add({
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})
local neogit = require("neogit")
neogit.setup({
	integrations = {
		diffview = true,
	},
})
vim.keymap.set("n", "<leader>gp", function()
	neogit.open({ kind = "split" })
end, { desc = "open git panel" })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "open git diff" })
