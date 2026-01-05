require("packs.theme")

require("packs.refactoring")
local on_save_group = vim.api.nvim_create_augroup("OpenPluginOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = on_save_group,
	pattern = "*",
	once = true,
	callback = function()
		require("packs.git")
	end,
})

local on_open_group = vim.api.nvim_create_augroup("OnFile", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	group = on_open_group,
	callback = function()
		require("packs.lint")
	end,
})

local after_open_group = vim.api.nvim_create_augroup("AfterFileOpen", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = after_open_group,
	once = true,
	callback = function()
		require("packs.treesitter")
		require("packs.undotree")
		require("packs.conform")
	end,
})

local enter_group = vim.api.nvim_create_augroup("OnEnter", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = enter_group,
	once = true,
	callback = function()
		require("packs.fzf")
		require("packs.oil")
		require("packs.lualine")
		require("packs.mason")
		require("packs.whichkey")
		require("packs.dap")
	end,
})

local insert_group = vim.api.nvim_create_augroup("OnInsert", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = insert_group,
	once = true,
	callback = function()
		require("packs.blink")
		require("packs.autopairs")
	end,
})
