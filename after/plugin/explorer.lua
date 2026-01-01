require("oil").setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, bufnr)
			local m = name:match("^%.")
			return m ~= nil
		end,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
