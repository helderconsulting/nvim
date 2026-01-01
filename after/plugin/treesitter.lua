local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if ok then
	treesitter.setup({
		ensure_installed = {
			"help",
			"javascript",
			"typescript",
			"c",
			"lua",
			"rust",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})

	vim.api.nvim_create_autocmd("PackChanged", {
		desc = "handle treesitter updates",
		group = vim.api.nvim_create_augroup("treesitter-pack-change-update", { clear = true }),
		callback = function(event)
			if event.data.kind == "update" then
				vim.notify("treesitter updated, running TSUpdate...", vim.log.levels.INFO)
				local ok = pcall(vim.cmd, "TSUpdate")
				if ok then
					vim.notify("TSUpdate complete", vim.log.levels.INFO)
				else
					vim.notify("TSUpdate not available", vim.log.levels.WARN)
				end
			end
		end,
	})
end
