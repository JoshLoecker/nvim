-- from: https://github.com/loctvl842/nvim/blob/master/lua/beastvim/plugins/colorscheme.lua
return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      local monokai = require("monokai-pro")
      monokai.setup(opts)
      monokai.load()
    end
  }
}
