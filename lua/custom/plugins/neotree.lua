return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = false,
			filesystem = {
				filtered_items = {
					visible = true, -- show hidden files by default
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

		-- shortcuts to quit neovim windows completely
		vim.keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit All Windows" })
		vim.keymap.set("n", "<leader>qw", ":wqa<CR>", { desc = "Save and Quit All" })
		vim.keymap.set("n", "<leader>q!", ":qa!<CR>", { desc = "Force Quit All (No Save)" })

		vim.api.nvim_create_autocmd("VimEnter", {
			desc = "Open Neo-tree on startup",
			callback = function()
				vim.cmd("Neotree show")
				vim.cmd("wincmd l")
			end,
		})
	end,
}
