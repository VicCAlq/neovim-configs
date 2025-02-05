return {
  "monkoose/DoNe",
  lazy = true,
  -- optional configuration
  config = function()
    -- as example adding some keybindings
    vim.keymap.set("n", "<leader>db", "<Cmd>DoNe build<CR>")
    --- ...
  end,
}
