return {
	"nvim-mini/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		local _max_col_cache = { buf = -1, tick = -1, val = 0 }
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			local buf = vim.api.nvim_get_current_buf()
			local tick = vim.api.nvim_buf_get_changedtick(buf)
			if buf ~= _max_col_cache.buf or tick ~= _max_col_cache.tick then
				_max_col_cache.val = vim.fn.max(vim.tbl_map(function(line)
					return vim.fn.strdisplaywidth(line)
				end, vim.api.nvim_buf_get_lines(buf, 0, -1, false)))
				_max_col_cache.buf = buf
				_max_col_cache.tick = tick
			end
			return string.format("%%2l:%%2v of %%L:%d", _max_col_cache.val)
			-- return "%2l:%-2v of %L:%2V"
		end

		-- ... and there is more!
		--  Check out: https://github.com/nvim-mini/mini.nvim
	end,
}
