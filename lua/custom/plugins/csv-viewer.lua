return {
	"emmanueltouzery/decisive.nvim",
	config = function()
		require("decisive").setup({
			csv_separators = { ",", "|", "\t" },
		})
	end,
	lazy = true,
	ft = { "csv" },
	keys = {
		{
			"<leader>cc",
			":lua require('decisive').align_csv({ csv_separator = ',' })<cr>",
			{ silent = true },
			desc = "Align CSV with comma",
			mode = "n",
		},
		{
			"<leader>cp",
			":lua require('decisive').align_csv({ csv_separator = '|' })<cr>",
			{ silent = true },
			desc = "Align CSV with pipe",
			mode = "n",
		},
		{
			"<leader>ct",
			":lua require('decisive').align_csv({ csv_separator = '\t' })<cr>",
			{ silent = true },
			desc = "Align CSV with tab",
			mode = "n",
		},
	},
}
