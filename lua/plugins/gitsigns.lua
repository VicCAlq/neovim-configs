-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = function(_, opts)
    local icons = require "resources.icons"

    return {
      signs = {
        add = { text = icons.GitAdd },
        change = { text = icons.GitChange },
        delete = { text = icons.GitDelete },
        topdelete = { text = icons.Trash },
        changedelete = { text = icons.Changes },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  end
}
