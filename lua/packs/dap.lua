vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/jbyuki/one-small-step-for-vimkind",
})

local dap_ok, dap = pcall(require, "dap")
local utils = require("dap.utils")
local dapui_ok, dapui = pcall(require, "dap-view")
dap.set_log_level("TRACE")
if dap_ok and dapui_ok then
	dapui.setup()
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end
for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch typescript file",
			runtimeExecutable = "node",
			runtimeArgs = {
				"--experimental-strip-types",
				"${file}",
			},
			rootPath = "${workspaceFolder}",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{

			type = "pwa-node",
			request = "launch",
			name = "Launch javascript file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process ID",
			processId = utils.pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Run this file",
		start_neovim = {},
	},
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance (port = 8086)",
		port = 8086,
	},
}

dap.adapters = {
	["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "js-debug-adapter",
			args = {
				"${port}",
			},
		},
	},
	["nlua"] = function(callback, config)
		local adapter = {
			type = "server",
			host = config.host or "127.0.0.1",
			port = config.port or 8086,
		}
		if config.start_neovim then
			local dap_run = dap.run
			dap.run = function(c)
				adapter.port = c.port
				adapter.host = c.host
			end
			require("osv").run_this()
			dap.run = dap_run
		end
		callback(adapter)
	end,
}
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("n", "<F5>", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
keymap("n", "<F6>", dap.continue, opts)
keymap("n", "<F10>", dap.step_over, opts)
keymap("n", "<F11>", dap.step_into, opts)
keymap("n", "<F12>", dap.step_out, opts)

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {
	desc = "toggle breakpoint",
})

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapStoppedLine", { text = "", texthl = "DapStoppedLine", numhl = "DapStoppedLine" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", numhl = "DapStopped" })
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpointRejected", numhl = "DapBreakpointRejected" }
)

local colors = {
	red = "#f7768e",
	green = "#9ece6a",
	orange = "#ff9e64",
	grey = "#565f89",
}
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = colors.red })
vim.api.nvim_set_hl(0, "DapStopped", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = colors.orange })
vim.api.nvim_set_hl(0, "DapStoppedLine", { fg = "#2e3c64" })
