return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "moll/vim-bbye",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local icons = require("resources.icons")
    local map = vim.keymap.set

    require("bufferline").setup({
      options = {
        mode = "buffers",
        themable = true,
        numbers = "none",
        close_command = "bdelete! %d",
        close_icon = icons.Close,
        path_components = 1,
        modified_icon = icons.Modified,
        left_trunc_marker = icons.ArrowLeft,
        right_trunc_marker = icons.ArrowRight,
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 20,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true,
        separator_style = { "|", "|" },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        show_tab_indicators = true,
        indicator = {
          icon = icons.Mark,
          style = "none",
        },
        icon_pinned = icons.Pin,
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = "insert_at_end",
        highlights = {
          buffer_selected = {
            bold = true,
            italic = true,
          },
        },
      },
    })

    map("n", "<b", ":BufferLineMovePrev<CR>", { desc = "Move current buffer left", remap = true })
    map("n", ">b", ":BufferLineMoveNext<CR>", { desc = "Move current buffer right", remap = true })
    map("n", "[b", ":BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer", remap = true })
    map("n", "]b", ":BufferLineCycleNext<CR>", { desc = "Cycle to next buffer", remap = true })
    map("n", "<leader>C", ":BufferLineCloseOthers<CR>", { desc = "Close all other buffers", remap = true })
    map("n", "<leader>p", ":BufferLineTogglePin<CR>", { desc = "(un)[P]in current buffer", remap = true })
  end,
}
