return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = "VimEnter",
  lazy = false,
  config = function()
    local icons = require("resources.icons")
    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
      icons = {
        rules = false,
        -- breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
        group = icons.Ellipsis .. "  ", -- symbol prepended to a group
        separator = icons.Selected, -- symbol used between a key and it's label
      },
      show_keys = false,
      show_help = true, -- show a help message in the command line for using WhichKey
      layout = {
        align = "center",
        margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        position = "bottom", -- bottom, top
        winblend = 50, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
      },
      win = {
        border = "rounded",
        title = true,
        no_overlap = true,
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      },
      wk.add({
        { "<leader>f", group = "[F]ind (telescope)" },
        { "<leader>d", group = "[D]iagnostics" },
        { "<leader>T", group = "Vim [T]abs" },
        { "<leader>S", group = "[S]plits" },
        { "<leader>t", group = "[T]erminals" },
        { "<leader>x", group = "E[X]ecute" },
        { "<leader>l", group = "[L]SP actions" },
        { "<leader>s", group = "[S]essions" },
        { "<leader>g", group = "[G]enAI" },
        { "<leader>b", group = "[B]uffers" },
        { "<leader>C", group = "[C]olors" },
        -- 	{ "<leader>e", group = "File Tree" },
        -- 	{ "<leader>u", group = "Undotree" },
        -- 	{ "<leader>o", group = "Options Commands" },
        -- 	{ "<leader>p", group = "Pane" },
        -- 	{ "<leader>t", group = "Terminal" },
      }),
    })
  end,
}
