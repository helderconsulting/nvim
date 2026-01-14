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
vim.keymap.set("n", "<leader>g", function()
	neogit.open({ kind = "split" })
end, { desc = "open git panel" })
