local fzf = require("fzf-lua")

-- search
vim.keymap.set("n", "<leader>sf", fzf.files)
vim.keymap.set("n", "<leader>sb", fzf.buffers)
vim.keymap.set("n", "<leader>sh", fzf.undotree)
vim.keymap.set("n", "<leader>sp", fzf.live_grep)

-- git
vim.keymap.set("n", "<leader>gb", fzf.git_branches)
vim.keymap.set("n", "<leader>gc", fzf.git_commits)
vim.keymap.set("n", "<leader>gs", fzf.git_status)

-- code
vim.keymap.set("n", "<leader>cr", fzf.lsp_references)
vim.keymap.set("n", "<leader>cd", fzf.lsp_typedefs)
vim.keymap.set("n", "<leader>ci", fzf.lsp_implementations)
vim.keymap.set("n", "<leader>cs", fzf.lsp_document_symbols)

-- debug
vim.keymap.set("n", "<leader>db", fzf.dap_breakpoints)
vim.keymap.set("n", "<leader>dc", fzf.dap_configurations)
