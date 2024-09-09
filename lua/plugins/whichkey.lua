return {
  'folke/which-key.nvim',
	dependencies = {
		"echasnovski/mini.icons",
	},
  lazy = false,
	opts = {
		icons = { group = vim.g.icons_enabled and "" or "+", separator = icons.Selected },
		disable = { filetypes = { "TelescopePrompt" } },
	},
	config = function()
	  local icons = require "resources.icons"
	  local wk = require "which-key"

		wk.setup({
			plugins = {
				marks = true,     -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true,     -- misc bindings to work with windows
					z = true,       -- bindings for folds, spelling and others prefixed with z
					g = true,       -- bindings for prefixed with g
				},
			},
			icons = {
				rules = true,
				breadcrumb = icons.ArrowAngleDoubleRight, -- symbol used in the command line area that shows your active key combo
				group = icons.ArrowAngleFilledRight,  -- symbol prepended to a group
				separator = icons.Selected,           -- symbol used between a key and it's label
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3,                -- spacing between columns
				align = "center",           -- align columns left, center or right
			},
			win = {
				border = "rounded",    -- none, single, double, shadow
				position = "bottom",  -- bottom, top
				margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 5,         -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000,        -- positive value to position WhichKey above other floating windows.
				title = true,
				no_overlap = false,
			},
			keys = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			filteer = false,     -- enable this to hide mappings for which you didn't specify a label
			show_help = true,    -- show a help message in the command line for using WhichKey
			show_keys = true,    -- show the currently pressed key and its label as a message in the command line
    })
	end

}
