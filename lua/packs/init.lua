require("packs.theme")

local on_save_group = vim.api.nvim_create_augroup("OpenPluginOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = on_save_group,
	pattern = "*",
	once = true,
	callback = function()
		require("packs.git")
	end,
})
local file_group = vim.api.nvim_create_augroup("OnFileOpen", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = file_group,
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
	end,
})
