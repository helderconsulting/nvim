vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.get_prev)
vim.keymap.set("n", "]d", vim.diagnostic.get_next)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

vim.keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "Q", "<nop>")
