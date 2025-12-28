vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lualine/lualine.nvim"
})

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
