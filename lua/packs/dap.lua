vim.keymap.set("n", "<leader>b", function()
	vim.pack.add({
		"https://github.com/mfussenegger/nvim-dap",
		"https://github.com/rcarriga/nvim-dap-ui",
		"https://github.com/nvim-neotest/nvim-nio",
	})

	local dap_ok, dap = pcall(require, "dap")
	local nio_ok, _ = pcall(require, "nio")

	if dap_ok and nio_ok then
		require("dapui").setup()
	end
	dap.toggle_breakpoint()
end, {
	desc = "toggle breakpoint",
})
