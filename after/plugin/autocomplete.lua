require("blink.cmp").setup({
	completion = {
		list = {
			selection = { preselect = false, auto_insert = true },
			max_items = 10,
		},
		documentation = { auto_show = true },
		menu = {
			scrollbar = false,
			draw = {
				gap = 2,
				columns = {
					{ "kind_icon", "kind", gap = 1 },
					{ "label", "label_description", gap = 1 },
				},
			},
		},
	},
	sources = {
		default = function()
			local sources = { "lsp", "buffer" }
			local ok, node = pcall(vim.treesitter.get_node)

			if ok and node then
				if not vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
					table.insert(sources, "path")
				end
				if node:type() ~= "string" then
					table.insert(sources, "snippets")
				end
			end

			return sources
		end,
		per_filetype = {
			codecompanion = { "codecompanion", "buffer" },
		},
	},
})
