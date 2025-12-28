local ok_tokyo, tokyonight = pcall(require, "tokyonight")
if ok_tokyo then
	tokyonight.setup()
	vim.cmd[[colorscheme tokyonight]]
end

local ok_lualine, lualine = pcall(require, "lualine")
if ok_lualine then
	lualine.setup({
		options = {
			theme = "tokyonight"
		}
	})
end
