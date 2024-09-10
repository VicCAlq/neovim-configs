-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	'nvim-neo-tree/neo-tree.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
		"3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	cmd = 'Neotree',
	keys = {
		{ '\\',        ':Neotree reveal<CR>',                desc = 'NeoTree reveal', silent = true },
		{ '<leader>e', ':Neotree toggle position=right<CR>', desc = 'Open Neotree',   silent = true },
		{ '<leader>o', ':Neotree toggle position=right<CR>', desc = 'Open Neotree',   silent = true },
	},
	opts = function()
		local utils = require "core.utils"
		local icons = require "resources.icons"

		return {
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			sources = { "filesystem", "buffers", "git_status" },

			source_selector = {
				winbar = true,
				content_layout = "center",
				sources = {
					{ source = "filesystem",  display_name = icons.FolderClosed .. " File" },
					{ source = "buffers",     display_name = icons.DefaultFile .. " Bufs" },
					{ source = "git_status",  display_name = icons.Git .. " Git" },
					{ source = "diagnostics", display_name = icons.Diagnostic .. " Diagnostic" },
				},
			},

			default_component_configs = {
				indent = { padding = 0 },
				modified = { symbol = icons.FileModified },
				icon = {
					folder_closed = icons.FolderClosed,
					folder_open = icons.FolderOpen,
					folder_empty = icons.FolderEmpty,
					folder_empty_open = icons.FolderEmpty,
					default = icons.DefaultFile,
				},
				git_status = {
					symbols = {
						added = icons.GitAdd,
						deleted = icons.GitDelete,
						modified = icons.GitChange,
						renamed = icons.GitRenamed,
						untracked = icons.GitUntracked,
						ignored = icons.GitIgnored,
						unstaged = icons.GitUnstaged,
						staged = icons.GitStaged,
						conflict = icons.GitConflict,
					},
				},
			},

			commands = {

				system_open = function(state)
					vim.ui.open(state.tree:get_note():get_id())
				end,

				parent_or_close = function(state)
					local node = state.tree:get_node()
					if (node.type == "directory" or node:has_children()) and node:is_expanded() then
						state.commands.toggle_node(state)
					else
						require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
					end
				end,

				child_or_open = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" or node:has_children() then
						if not node:is_expanded() then -- if unexpanded, expand
							state.commands.toggle_node(state)
						else                     -- if expanded and has children, seleect the next child
							require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
						end
					else -- if not a directory just open it
						state.commands.open(state)
					end
				end,

				copy_selector = function(state)
					local node = state.tree:get_node()
					local filepath = node:get_id()
					local filename = node.name
					local modify = vim.fn.fnamemodify

					local vals = {
						["BASENAME"] = modify(filename, ":r"),
						["EXTENSION"] = modify(filename, ":e"),
						["FILENAME"] = filename,
						["PATH (CWD)"] = modify(filepath, ":."),
						["PATH (HOME)"] = modify(filepath, ":~"),
						["PATH"] = filepath,
						["URI"] = vim.uri_from_fname(filepath),
					}

					local options = vim.tbl_filter(function(val)
						return vals[val] ~= ""
					end, vim.tbl_keys(vals))
					if vim.tbl_isempty(options) then
						utils.notify("No values to copy", vim.log.levels.WARN)
						return
					end
					table.sort(options)
					vim.ui.select(options, {
						prompt = "Choose to copy to clipboard:",
						format_item = function(item)
							return ("%s: %s"):format(item, vals[item])
						end,
					}, function(choice)
						local result = vals[choice]
						if result then
							utils.notify(("Copied: `%s`"):format(result))
							vim.fn.setreg("+", result)
						end
					end)
				end,

				find_in_dir = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					require("telescope.builtin").find_files({
						cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
					})
				end,
			},

			window = {
				width = 30,
				mappings = {
					["<space>"] = false, -- disable space until we figure out which-key disabling
					["[b"] = "prev_source",
					["]b"] = "next_source",
					F = utils.is_available("telescope.nvim") and "find_in_dir" or nil,
					O = "system_open",
					Y = "copy_selector",
					h = "parent_or_close",
					l = "child_or_open",
					o = "open",
				},
				fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
					["<C-j>"] = "move_cursor_down",
					["<C-k>"] = "move_cursor_up",
				},
			},
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
				window = {
					mappings = {
						['\\'] = 'close_window',
					},
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(_)
						vim.opt_local.signcolumn = "auto"
					end,
				},
			},
		}
	end,
}
