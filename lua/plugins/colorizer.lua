return {
  -- High-performance color highlighter
  "norcalli/nvim-colorizer.lua",
  event = "BufEnter",
  config = function()
    require("colorizer").setup()
  end,
}
