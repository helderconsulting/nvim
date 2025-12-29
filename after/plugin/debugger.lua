local dap_ok, dap = pcall(require, "dap")
local nio_ok, _ = pcall(require, "nio")

if dap_ok and nio_ok then
	require("dapui").setup()
end

vim.keymap.set("n", "<leade>tb", dap.toggle_breakpoint)
