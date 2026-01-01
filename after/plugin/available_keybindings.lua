local which_key = require("which-key")

which_key.setup({
	opts = {
		triggers = {
			{ "<leader>", mode = { "n", "v", "d" } },
		},
	},
})

print("which-key")
