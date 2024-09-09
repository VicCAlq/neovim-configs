return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local icons = require "resources.icons"

    local mode = {
      "mode",
      fmt = function(str)
        return icons.Vim .. str
      end,
    }

    local filename = {
      "filename",
      file_status = true,
      path = 1,
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = {
        error = icons.DiagnosticError,
        warn = icons.DiagnosticWarn,
        info = icons.DiagnosticInfo,
        hint = icons.DiagnosticHint,
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = {
        added = icons.SymAdded,
        modified = icons.SymModified,
        removed = icons.SymRemoved,
      }, -- changes diff symbols
      cond = hide_in_width,
    }

    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "kanagawa", -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = {
          left = icons.DrawSlantLeft,
          right = icons.DrawSlantRight,
        },
        component_separators = {
          left = icons.DrawSlantLine,
          right = icons.DrawSlantLine,
        },
        -- disabled_filetypes = { "alpha", "neo-tree" }, -- Hide lualine in these buffers
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { filename },
        lualine_x = {
          diagnostics,
          diff,
          { "encoding", cond = hide_in_width },
          { "filetype", cond = hide_in_width }
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    }
  end,
}
