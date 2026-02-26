return {
  "nvim-mini/mini.indentscope",
  opts = function(_, opts)
    opts.draw = opts.draw or {}
    opts.draw.animation = function()
      return 5
    end
    opts.draw.delay = 0
  end,
}
