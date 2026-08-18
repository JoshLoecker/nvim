-- Make tab sizes 2 in these files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml", "yml", "lua" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Focus on NeoTree if no files provided
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Focus Neo-Tree on startup if no file is specified",
	callback = function()
		local argc = vim.fn.argc() -- check if a file or directory was provided

		-- check if current buffer is empty and unnamed
		local bufnr = vim.api.nvim_get_current_buf()
		local buf_name = vim.api.nvim_buf_get_name(bufnr)
		local buf_empty = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)[1] == ""
			and vim.api.nvim_buf_line_count(bufnr) == 1

		if argc == 1 and buf_name == "" and buf_empty then
			-- Replace "filesystem" with "buffers" or "git_status" if default source is different
			vim.cmd("Neotree focus filesystem left")
		end
	end,
})
