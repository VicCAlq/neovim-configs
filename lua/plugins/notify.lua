return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    vim.opt.termguicolors = true
    vim.notify = require("notify")
    local notify = require("notify")

    notify.setup({
      minimum_width = 50,
      render = "compact",
      background_colour = "#1d2021",
      stages = "fade_in_slide_out",
      timeout = 250,
      fps = 30,
      top_down = false,
    })
  end,
}
