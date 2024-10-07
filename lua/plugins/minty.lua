return {
  { "nvchad/volt", lazy = false },
  {
    "nvchad/minty",
    lazy = false,
    config = function()
      local map = vim.keymap.set

      map({ "n", "v" }, "<leader>Cc", function()
        require("minty.huefy").open({ border = true })
      end, { desc = "Open hue selector" })
      map({ "n", "v" }, "<leader>Cs", function()
        require("minty.shades").open({ border = true })
      end, { desc = "Open shade selector" })
    end,
  },
}
