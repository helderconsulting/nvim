vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("Lsp", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			-- Built-in completion
			if vim.g.completion_mode == "native" and client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			end

			if client:supports_method("textDocument/documentColor") then
				vim.lsp.document_color.enable(true, args.buf, {
					style = "background", -- 'background', 'foreground', or 'virtual'
				})
			end
		end

		vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "go to [d]efinition" })
		vim.keymap.set(
			"n",
			"<leader>io",
			vim.lsp.buf.hover,
			{ desc = "[o]pen information about the symbol under cursor" }
		)
	end,
})

vim.lsp.enable({
	"lua_ls",
	"rust_ls",
	"typescript_ls",
})
