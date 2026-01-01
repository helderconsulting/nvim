-- info
vim.keymap.set("n", "<leader>ie", vim.diagnostic.open_float, { desc = "[e]rror info" })
vim.keymap.set("n", "<leader>io", vim.lsp.buf.hover, { desc = "[o]pen information about the symbol under cursor" })

vim.keymap.set("n", "<C-n>", "<C-w>n", { desc = "Move to the left window", remap = true })
vim.keymap.set("n", "<C-o>", "<C-w>o", { desc = "Move to the bottom window", remap = true })
vim.keymap.set("n", "<C-e>", "<C-w>e", { desc = "Move to the top window", remap = true })
vim.keymap.set("n", "<C-i>", "<C-w>i", { desc = "Move to the right window", remap = true })
--vim.keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv")
--vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "cd", vim.lsp.buf.definition, { desc = "go to [d]efinition" })

print("remap")
