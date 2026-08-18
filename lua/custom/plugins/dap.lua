return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	ft = "python",
	config = function()
		require("dap-python").setup(vim.fn.exepath("python"))
		require("dap-python").test_runner = "pytest"
	end,
}
