return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VimEnter",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = "▏",
      scope = {
        show_start = false,
        show_end = false,
        show_exact_scope = false,
      },
      exclude = {
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
        },
      },
    },
  },
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fed589" })
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e77050" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#95b1cd" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#f8973d" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a2c37d" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#c38fa8" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#80b1a5" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup({ scope = { highlight = highlight } })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
