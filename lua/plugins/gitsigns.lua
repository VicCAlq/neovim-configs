-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  opts = function(_, opts)
    local icons = require("resources.icons")

    return {
      signs = {
        add = { text = icons.GitFrameAdd },
        change = { text = icons.GitFrameChange },
        delete = { text = icons.GitFrameDelete },
        topdelete = { text = icons.Trash },
        changedelete = { text = icons.Replace },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    }
  end,
}
