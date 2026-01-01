local fzf = require("fzf-lua")

-- search
vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[f]iles: search across all files" })
vim.keymap.set("n", "<leader>sc", function()
	fzf.files({ cwd = "~/.config/nvim/" })
end, { desc = "[c]onfig: search vim configurations" })
vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "[b]uffers: see all open buffers" })
vim.keymap.set("n", "<leader>sh", fzf.undotree, { desc = "[h]istory: browse current file changes" })
vim.keymap.set("n", "<leader>sp", fzf.live_grep, { desc = "[p]roject: find term in current project" })

-- git
vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "[b]ranches" })
vim.keymap.set("n", "<leader>gc", fzf.git_commits, { desc = "[c]ommits" })
vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "[s]tatus: see all changes to commit" })

-- code
vim.keymap.set("n", "<leader>cr", fzf.lsp_references, { desc = "[r]eferences: list usage" })
vim.keymap.set("n", "<leader>ci", fzf.lsp_implementations, { desc = "[i]mplementations" })
vim.keymap.set(
	"n",
	"<leader>cs",
	fzf.lsp_document_symbols,
	{ desc = "[s]ymbols: list all symbols of the current document" }
)

-- debug
vim.keymap.set("n", "<leader>db", fzf.dap_breakpoints, { desc = "[b]reakpoints: list all active breakpoints" })
vim.keymap.set("n", "<leader>dc", fzf.dap_configurations, { desc = "[c]onfigurations: browse debug configurations" })

print("finder")
