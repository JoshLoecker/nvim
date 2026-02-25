-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Always open at start of file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end,
})
